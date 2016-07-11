---
layout: post
title: Ground Plane Jumps the Fence
description: Final Serial Squid, Small Version, Ground Plane Problem
category: blog
tag: blog
---

Just lost my ground plane on this final version of the serial squid.  As the PCB outline is complex, I followed the advice of some other KiCAD users, and just let the PCB edge naturally truncate the copper pours on the ground and power planes.  This worked well until today, when suddenly the ground plane decided to jump the fence, so to speak.

![ground-plane-problem](/images/squid-small-ground-plane.png)

You can see that the copper pours on the split power plane are respectful, and know their boundaries.

![power-plane-no-problem](/images/squid-small-power-plane.png)

