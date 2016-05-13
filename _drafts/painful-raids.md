---
layout: post
title: painful-raids
---

As part of my ongoing effort to better organize my digital data, I've been using a Network Attached Storage (NAS) device for the past couple of years.  These are basically a standalone hard disk drive, typically with multiple drives configured as a RAID array, and connected to your local network by ethernet.  In my case, I have a Buffalo Linkstation Duo, model LS-WXL 682.  It came from the factory outfitted with two each one terabyte hard disk drives pre-configured as a RAID-0 array.

Initially I didn't fully grasp the subtle implications of it being RAID-0.  I knew I wasn't getting any error correction benefit, but in the back of my mind I was planning to eventually change out the drives with larger ones, and would reconfigure to RAID 1 at that point (this unit only has two drive bays, so other RAID techniques aren't possible). That time came last week, when two brand new four terabyte drives were tossed onto my doorstep over the front yard fence by a careless delivery man.  I can report that the drives passed this informal method of drop testing, and are currently spinning happily awwy. But getting to this point was a nightmare which was about to begin. 

One aspect of this NAS that attracted my attention was that there is a community which provides alternate open-sourced firmware for it, similar to the OpenWRT project. It was also reasonably priced, being targeted to home and small office applications.  I discovered last week one method they used cut the costs on this unit - there is no firmware store inside!  The embedded firmware for the NAS is contained on one (both?) of the disk drives. As I learned, this has profound impact on what should be a straightforward procedure in a RAID, swapping or upgrading to new disk drives. 

Let me speak up in defense of Buffalo regarding one point.  Apparently, if your RAID is configured as RAID-1, then upgrading to a new pair of drives is reportedly as simple as swapping one drive, let the RAID resynch, the swapping the other.  Alas, the default settings on this unit were RAID-0, meaning this simple method is unavailable to those who don't change the settings immediately after purchase. 

I also want to point out that I didn't have any data loss or other problem.  I just wanted to upgrade to larger disks. Most of the online help I could find involved people who had experienced disk crashes of one sort or another, although the procedures I had to follow were substantially the same.  The whole process is made more confusing by several factors.  Buffalo doesn't officially support the act of upgrading drives, or so it appeared to me after days of searching.  They provide some information, with lots of disclaimers and warnings about it being out of date.  It also doesn't help that they made some dozen variations of of these small NAS units, many varying in subtle but critical ways when it comes to upgrading.  

So, when one powers up this NAS with brand new, blank hard disks, it is stupid.  It has no firmware beyond a poorly documented bare-bones boot loader.  Interacting with this boot loader involves a single pushbutton on the rear of the unit.  It doesn't help that this button operates slightly differently depending on which model of NAS you have.  Feedback from the boot loader is via multi colored lights which flash in various patterns, reminiscent of the old POST beep codes.  That in itself isn't so bad, but again, different models used different flashing codes.

The whole process was beginning to look  like black magic. I almost immediately gave up on the idea of changing to one of the open source firmwares, as the process just to restore the factory firmware was initially so confusing.  I didn't want to complicate things further.  So my goal was simple, just reinstall the factory firmware on this new pair of disk drive. 

The most documented method seems to use the TFTP protocol, something I haven't used in over 20 years.  Not to be deterred, I was finally able to successfully transfer firmware over TFTP to the unit. This required a Windows computer, and digging around various unofficial sites to find the proper firmware, the majority of them having disappeared in the few years since this NAS was manufactured. Success was attained, buy



