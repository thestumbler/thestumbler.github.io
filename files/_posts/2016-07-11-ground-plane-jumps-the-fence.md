---
layout: post
title: Ground Plane Jumps the Fence
description: Final Serial Squid, Small Version, Ground Plane Problem
tag: blog
---

Just lost my ground plane on this final version of the serial squid.  As the PCB outline is complex, I followed the advice of some other KiCAD users, and just let the PCB edge naturally truncate the copper pours on the ground and power planes.  This worked well until today, when suddenly the ground plane decided to jump the fence, so to speak.

![ground-plane-problem](/images/squid-small-ground-plane.png)
<i><center><a href="/images/orig/squid-small-ground-plane.png">Click here to see larger version</a></center></i> 


You can see that the copper pours on the split power plane are respectful, and know their boundaries.

![power-plane-no-problem](/images/squid-small-power-plane.png)
<i><center><a href="/images/orig/squid-small-power-plane.png">Click here to see larger version</a></center></i> 

Also, see here that it doesn't actually pour across the fence, but it "jumps" over the fence leaving a small clearance gap.  This clearance is all around the entire perimeter of the board.


![fence-edge-detail](/images/squid-small-edge-of-fence.png)
<i><center><a href="/images/orig/squid-small-edge-of-fence.png">Click here to see larger version</a></center></i> 

**SOLVED**

I found the problem, almost by accident.  If you look closely at the mounting hole in the above picture, you'll see that I took a short-cut that was the cause of my problem.  The center of the mounting hole was positioned exactly at the center of the semi-circular end of the slot.  The intention here was to make this particular slot more like a keyhole.  The true mounting holes on the resulting board will be partially open at the slot (I haven't cleared this with my PCB shop, they may want me to make it closed off).

Anyway, that was the problem.  I can't say exactly why, but the small portion of the mounting hole pad that overlapped the slot caused KiCAD to think I wanted the copper pour filled even outside the boundary of the board.  I can hardly complain, as this is a peculiar and possibly erroneous usage. For now, I was able to "solve" the problem by adding a tiny piece of a circular arc on the PCB outline layer, as shown in the below screen shot.

![ground-plane-tamed](/images/squid-small-ground-plane-tamed.png)
<i><center><a href="/images/orig/squid-small-ground-plane-tamed.png">Click here to see larger version</a></center></i> 


This indeed prevents the copper pour from filling outside the board boundary.  An alternative, which might be beyond my KiCAD skills at this point, would be to make a special mounting hole that has a slot cut out.  I'll defer that until I talk to the PCB shop and find out how would be the best way to actually fabricate this weird hole.




