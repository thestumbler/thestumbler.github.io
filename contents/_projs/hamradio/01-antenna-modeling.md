---
layout: page
title: Antenna Simulations
subtitle: Checking out Rooftop Antenna Patterns
image: "/images/hamradio/smith-chart.png"
bigimg: "/images/hamradio/g5rv-sketch.png"
show-avatar: true
date: 2019-01-29
comments: true
collection: proj
category: hamradio
seq: 1
---

Last year I did a little electromagnetic antenna simulation for a project
of mine. Actually, I just operated an existing simulator, a piece of software called
[Numerical Electromagnetics Code](https://en.wikipedia.org/wiki/Numerical_Electromagnetics_Code)
which hails from the 1970s and originally written in 
[FORTRAN](https://en.wikipedia.org/wiki/FORTRAN). This incarnation I am 
running is called [cocoaNEC](http://www.w7ay.net/site/Applications/cocoaNEC/)
written for MAC OS X by Kok Chen, W7AY. 

Recently one of my Ham radio friends is moving to a new building,
and I volunteered to help do some simulations for a few candidate 
antenna installations at his new location, or QTH in Ham radio shorthand: 
[Q-signals](https://en.wikipedia.org/wiki/Q_code).

## Quick version

The antenna he plans to use is called a 
[G5RV](https://en.wikipedia.org/wiki/G5RV_antenna),
a special dipole designed in 1940s Great Britain by Louis Varney, G5RV.
Using cocoaNEC, I
was able to model the antenna and estimate the radiation patterns.
He's still evaluating the results and we are discussing other antennas
to evaluate. Now that the mechanics of running the simulations are
understood, it should go smoothly (famous last words).

## Detailed Version

Legacy code like the NEC that has been around since the 1970s 
carries a lot of baggage. 
One thing is the quaint method of data input using
punched card data format.

![punch-card](/images/hamradio/punch-card.jpg)

I thought I could safely ignore that, using the more modern methods
offered by today's versions of NEC.  Besides reading punch card format
data, CocoaNEC offers two modern input methods:

  * **Spreadsheet**

    an interactive spreadsheet-like approach which provides interactive 
    control over the antenna and simulation data using an easy-to-use,
    intuitive GUI interface.

  * **NC  (short for "NEC C")**

    a C-language-like programming approach for describing the antenna
    and simulation data. According to the author, this is the preferred
    method, and the spreadsheet method is being depreciated.


This isn't quite as great as it sounds at first.
While the core electromagnetic calculations are the same, 
the interactive portions of the program are like three separate 
programs in one. If you create an antenna using one method, 
you basically have to stick with that method (all methods can WRITE the antenna
simulation in punch card "deck" format, but this isn't very helpful unless you
are exporting your design to another NEC analysis program)

Because this punched card format is the common denominator of all NEC-based 
programs today, many online examples of antennas will be in this format. 
I found such an example of a G5RV antenna, and after some time I came to
realize the above problem.  I just gave up and recreated the antenna using
one of the modern formats.

After briefly reading the documentation, I decided on the NC format.
I'm a C-language programmer, so it should be easy.  It was, in fact, 
quite easy to model this antenna using NC. But I soon began to regret
that choice.

With an NC model, you can tweak the variables in the program code,
much easier than you could with a deck of punched cards! However in 
NC mode, cocoaNET's GUI program doesn't give you control over this 
tweaking, despite having an excellent interactive GUI for tweaking 
your antenna when in the depreciated spreadsheet mode. 
There is no way to convert from one to the other 
(I did confirm this with the author).

I was constantly editing the NC file and re-running the simulator. I couldn't
figure out a way to run the simulator from the command line (I'm waiting on
feedback from the author), which would have made it much simpler. If I was
going to be doing this seriously for hundreds of tweaks, I would figure out how
to script this, or find another command-line version of the NEC.

But this frustration aside, I am truly impressed with this
program. It was easy to get started using, and the author has done 
an admirable job putting this together for MAC users.  Here's a 
sample gain plot of the G5RV. Now that I have the basics figured out,
it's time to experiment some with different variations of antennas.

![g5rv-freespace-gain](/images/hamradio/g5rv-gain-plot.png)
*G5RV Antenna in Free Space, Gain vs Azimuth*


## Reference Links for Later

* [Article on the G5RV](http://www.astrosurf.com/luxorion/qsl-g5rv.htm)
* [G5RV Patterns, 1](https://www.ar15.com/forums/outdoors/G5RV_radiation_pattern_question/22-681844/?)
* [G5RV Patterns, 2](http://www.radioqrv.com/documents/RadioQRV%20-%20G5RV%20Antenna%20Patterns%20-%20Complete.pdf)
* [Twin-Lead Ladder Line](https://en.wikipedia.org/wiki/Twin-lead)
* [Ladder Line Calculator](https://hamwaves.com/zc.circular/en/index.html)



