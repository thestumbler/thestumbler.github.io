---
layout: page
avatar: "/images/modelrr/engine.jpg"
bigimg: "/images/modelrr/pwa-zoomed-two.jpg"
collection: proj
category: modelrr
title: It Works
subtitle: Lots of Graphs
seq: 4
date: 2019-01-27
comments: true
published: true
---


Once again, referring to the schematic:

![spice-schematic](/images/modelrr/conrad-sch.png)
*Spice Schematic*

Not surprisingly, I was able to show by SPICE simulation that the controller 
works as designed.  Specifically,

* Potentiometer P1 controls the delay to restart
* Potentiometer P2 controls the slowdown time
* Transistor Q3 functions as overload protector


Here are some charts showing different timings vs. Potentiometer settings.
Unfortunately, the *print graph* function didn't print the axes values, so
you'll have to believe the values from my notebook.

![startup-2k](/images/modelrr/startup-25k.png)
*P1 setting 25% ( 25,000 ohms ), restart = 16 secs*

![startup-50k](/images/modelrr/startup-50k.png)
*P1 setting 50% ( 50,000 ohms ), restart = 28 secs*

![startup-100k](/images/modelrr/startup-100k.png)
*P1 setting 90% ( 100,000 ohms ), restart = 40 secs*


![slowdown-1k-9k](/images/modelrr/slowdown-1k-9k.png)
*P2 setting 10% (1000 ^ 9000 ohms ), slowdown = 0.5 secs *

![slowdown-5k-5k](/images/modelrr/slowdown-5k-5k.png)
*P2 setting 50% (5000 ^ 5000 ohms ), slowdown not recorded *

![slowdown-9k-1k](/images/modelrr/slowdown-9k-1k.png)
*P2 setting 90% (9000 ^ 1000 ohms ), slowdown = 2.5 secs *



