---
layout: page
title: Spice and Kicad
subtitle: Making Kicad 5.0 play nice with Spice
image: "/images/modelrr/engine-nose.jpg"
bigimg: "/images/modelrr/pwa-zoomed-two.jpg"
collection: proj
category: modelrr
seq: 3
date: 2019-01-27
comments: true
published: true
---


Here is the Kicad schematic again, drawn for Spice analysis.

![spice-schematic](/images/modelrr/conrad-sch.png)
*Spice Schematic*

So, the first question was what version of [SPICE](https://en.wikipedia.org/wiki/SPICE) to use.

For the last serious SPICE simulation I did some years ago, I used 
[Beige Bag Software's B2.Spice A/S](http://www.beigebag.com/v5_features.htm). I still have that, 
but it is a Windows program and everything I'm working on these days is Mac or Linux.
So I sought out another solution.  No problem, there are still a lot of options:

  * [Analog Devices LTSpice](https://www.analog.com/en/design-center/design-tools-and-calculators/ltspice-simulator.html) 
    ( [wikipedia](https://en.wikipedia.org/wiki/LTspice) )
  * [Ngspice](http://ngspice.sourceforge.net)
    ( [wikipedia](https://en.wikipedia.org/wiki/Ngspice) )
  * [GnuCap](http://www.gnucap.org/dokuwiki/doku.php?id=gnucap:start)
    ( [wikipedia](https://en.wikipedia.org/wiki/GNU_Circuit_Analysis_Package) )
  * [MacSpice](https://www.macspice.com)
  * etc....

I started off trying to use the latest version of Kicad 5.0 which has new and improved
interface with SPICE (ngspice, specifically).  That turned out to be quite a struggle.
Several times along the way I gave up on Kicad/NgSpice and tried several of the other 
products.  Every one had it's own quirks, and I kept returning to the Kicad approach.
While still a little buggy, it was actually very well integrated and held promise for 
ease of use in the future.

This isn't going to be a how-to, but here are some of the issues I fought:

  * General setup of schematic for SPICE simulation
    [see here](https://mithatkonar.com/wiki/doku.php/kicad/kicad_spice_quick_guide)
    and [here](http://ngspice.sourceforge.net/ngspice-eeschema.html)
  * Diodes pins had to be swapped [see this topic](https://github.com/KiCad/kicad-symbols/issues/418)
  * Adding SPICE parts that don't exist [see this topic](https://forum.kicad.info/t/adding-spice-components-that-do-not-exist-in-pspice-library/12036/2)
  * Part model format differences (between different flavors of SPICE)

Ultimately I was pleased with the Kicad / SPICE setup.


## Some Links for my future Reference

  * [ngspice manual v26](http://ngspice.sourceforge.net/docs/ngspice26-manual.pdf)
  * [pspice format](http://www.ee.bgu.ac.il/~spice/Additional/pspcref.pdf)
  * [pspice format help](http://www.stuffle.net/references/PSpice_help/model.html)
  * [Kicad/eeschema manual](http://docs.kicad-pcb.org/stable/en/eeschema.html)
  * [LTSpice Reference](http://ltwiki.org/?title=B_sources_%28complete_reference%29)
  * [Model RR Brushed DC Motor History](http://www.sumidacrossing.org/LayoutElectricity/ModelTrainPower/DCTrainMotors/DCMotorTechHistory/?fbclid=IwAR3gh7ca2kTV5hN_iBj_b9WjjDifBdtKTDtCiz0WR_9-7jG4sRP5sOpeYvY)
  * [Modeling DC Motor in LTSPICE](https://www.slideshare.net/TsuyoshiHorigome/simple-model-of-dc-motor-using-ltspice)
  * [Example Model RR Motor Controllers](https://www.instructables.com/id/Simple-controllers-for-DC-motors-inc-PWM-inertia/)

