---
layout: post
date: 2016-05-13
title: Pain in the NAS
tags:  
- nas
- raid
- buffalo
- linkstation
- ls-wxl
---

As part of my ongoing effort to better organize my digital data, I've been using a Network Attached Storage (NAS) device for the past couple of years.  A NAS is a standalone hard disk connected to your local network by Ethernet.  They typically contain multiple disk drives configured in a RAID array.  In my case, I have the [Buffalo LinkStation Duo, model LS-WXL 682](http://www.buffalotech.com/products/network-storage/home-and-small-office/linkstation-duo).  It came from the factory outfitted with two each one terabyte hard disk drives, pre-configured as a RAID-0 array. Initially I didn't fully grasp the subtle implications of it being RAID-0.  I knew I wasn't getting any error correction benefit, but in the back of my mind I was planning to eventually change out the drives with larger ones.  I would reconfigure to RAID-1 at that point[^multibays].  That time came last week.  The delivery man tossed two brand new, four terabyte disk drives five meters over my front fence onto my doorstep. This can only be explained as a final on-site qualification drop test, carefully planned in advance by the manufacturer's QA department to instill confidence in the buyer.

### How Hard Can It Be?

The first thing I wanted to do was to change the firmware.  There is an [open source community](http://buffalo.nas-central.org/wiki/Main_Page") providing firmware for it[^kuro-readmore].  Not unlike the [OpenWRT project](https://openwrt.org) for LAN routers.  Not to mention, it was reasonably priced, being targeted to home and small office applications.  As I started researching the upgrade process, I discovered just where they cut the costs on this unit - there is no internal firmware storage!  The embedded firmware for the NAS is contained on one (both?) of the disk drives!  As I learned, this has profound impact on what should be a straightforward procedure in a RAID, swapping or upgrading to new disk drives.  

After one installs new disk drives, the NAS is as dumb as a rock.  The method of installing new firmware is cryptic, unclear, well-hidden, and hardly inspires confidence in the product.  It also gives one pause to find that Buffalo doesn't officially support the act of upgrading drives.  They provide some information, with disclaimers and warnings about being obsolete.  It also doesn't help that they made a dozen-plus variations of of these units, many varying in subtle but critical ways when it comes to upgrading.  

### NAS Goes to School

At this point, the NAS has no firmware, beyond a poorly documented, bare-bones boot loader.  Interacting with this boot loader involves a single push-button on the rear of the unit.  It doesn't help that this button operates slightly differently depending on which model of NAS you have.  Feedback from the boot loader is via multi colored lights which flash in various patterns, reminiscent of the old POST beep codes.  That in itself isn't so bad, but again, different models used different flashing codes.  The whole process was beginning to look  like black magic[^defend-buffalo].  I immediately gave up on the idea of changing to one of the open source firmwares, as the process just to restore the factory firmware was initially so confusing that I didn't want to complicate things further. My new goal was simple: just reinstall the factory firmware on this new pair of disk drives[^no-data-loss]. 

The most documented method of upgrading uses the TFTP protocol.  The specific procedure outlined requires using a Windows computer.  Not a problem in my lab, but for some MAC and Linux users this could be a show-stopper.  I also had to dig around in various unofficial web sites to find the proper firmware, the majority of such sites having disappeared in the few years since this NAS was manufactured.  I was successful, but only after multiple foiled attempts.  I still have no idea what magical combination of button pushing and flashing lights finally caused it to work, which is kind of disconcerting.  I had a like-new NAS, all ready to go.

Well, not exactly.  It seems that the first step using TFTP just loaded an intermediate boot loader, one that could communicate with another Buffalo program used for loading the _final_ firmware.  My unit was no longer dumb; it had completed first grade and was now ready to be trained as an actual NAS.  This next program, _lsupdater.exe_, also only available for Windows, finds your NAS unit over Ethernet.  It used a feature of Windows applications that I've never encountered before.  You manually edit the program's _.INI_ file, enabling a debug feature.  This adds a debug screen to the program's System menu, opening up normally-hidden features.  

I eventually got this working, but only after dozens of iterations trying to find the exact correct sequence of events.  Complicating all this is that the Windows computer and the NAS have to be on the same IP subnet, and the NAS can and does change it's IP address with ease.  There is a procedure to temporarily force the NAS to an IP address, and this often works.  The NAS also demonstrated initiative, and changed it's own IP address at random.  On one iteration, I thought I had succeeded.  But for some unknown reason, I had only partially completed the process.  After that, my disk drives weren't _new_ any more.  I finally realized that being empty was essential, but not after a lot of wasted attempts.  _All_ I had to do was to wipe the disks clean.  Of course, this is a task can't be done from the NAS.  You must remove the drives from the NAS and install them into another computer to delete all partitions to start over again.

### NAS Graduates!

_Finally_, after numerous failed attempts, I succeeded.  My NAS was now  as good as new - if you speak Japanese, that is!  That was easy to fix, however.  Fortunately many other NAS users don't speak Japanese, either, and have well documented the solution to this problem.

I started to document the exact steps I followed, but I eventually gave up.  In many cases, I had no idea why a certain procedure failed three times but worked on the fourth attempt.  If I had to do this again, I could do it by following existing instructions that I have bookmarked for future reference.  It sure was frustrating, though.  What's really perplexing is that this unit has a USB port.  It should have been simpler to allow the unit to restore it's firmware from a thumb drive.  In hindsight, I wonder if that might be possible.  But I don't want to waste any more time on this.

Once the NAS was up and running with the new disk drives, the remaining work has been surprisingly easy.  I keep two duplicates of nearly everything on the NAS on two external identical 1TB hard disks.  I simply mounted one of the hard disks one a workstation, and started an rsync command to clone all the files over to the NAS[^use-10base1000].  Lastly, I have some old computer backups which were only on the NAS that I want to transfer over.  It was surprisingly easy task to hook up the two old NAS disks to my workstation, mount them as a RAID-0 array using _mdadm_ command.  Now I have a fully functioning 4TB NAS RAID up and running.  And two free 1TB disk drives to install in my file server workstation.  

I build and design embedded systems for a living.  I'm not completely unfamiliar with boot loading embedded devices, and I've worked with much bigger RAID systems over the years.  While the process was a bit frustrating and stressful, I was never worried that I would damage anything.  I could have taken out the motherboard and dug even deeper if necessary (some users have added a serial port connection and/or reprogrammed certain chips using JTAG).  The whole process is clearly beyond the ability of a normal consumer, and quite challenging even to a technically minded user.  The Buffalo engineers really dropped the ball here.  I'm not sure they could have made the upgrade process more difficult if they consciously tried.  Who knows, this may have been the goal, encouraging customers to just buy new NAS boxes rather than chancing drives.


[^multibays]: My NAS has only two drive bays, so other RAID configurations aren't possible.  

[^kuro-readmore]: This [Wikipedia article]( https://en.wikipedia.org/wiki/Buffalo_network-attached_storage_series) has more information about the open source community which has sprung up.  

[^use-10base1000]: Using a 10BASE1000 1Gbps Ethernet interface is almost a requirement for cloning 1+ TB of files.  

[^no-data-loss]: I didn't have any data loss or hardware problems.  I just wanted to upgrade to larger disks.  Most of the online help I could find involved people who had experienced disk crashes of one sort or another, but I was lucky in that regard.

[^defend-buffalo]: In defense of Buffalo regarding one point: if your RAID is configured as RAID-1, then upgrading to a new pair of drives is reportedly simple.  You just swap one drive, let the RAID re-synch, the swap in the other.  Alas, the default settings on this unit were RAID-0, meaning this simple method is unavailable to those who don't change the settings immediately after purchase.  

