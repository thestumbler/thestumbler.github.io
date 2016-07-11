---
layout: post
title: Ground Plane Jumps the Fence
description: Final Serial Squid, Small Version, Ground Plane Problem
category: blog
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
