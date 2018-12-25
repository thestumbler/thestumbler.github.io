---
layout: page
category: modelrr
title: Model Railroad Start/Stop Controller
description: Analysis of N-Gauge Analog Controller using KiCAD & SPICE
publish: false
---

An acquaintance of mine recently asked if I could help him repair a kit
he had assembled.  This device is used on model railroad layouts, on a 
siding, for example, to automatically slowdown and stop the train, wait
for a period of time, and then start back up again.  The idea is to 
simulate a train stopping for passengers.

I had tinkered with [N-gauge](https://en.wikipedia.org/wiki/N_scale)
model railroads in the past, and this sounded like a simple and fun little
project to help him out.  Also, I had just reassembled my laboratory after
being in storage for over a year, so this was also a chance to make sure
everything was unpacked and working.

My friend's layout uses the old analog system of control.
There is no 
[PWM (pulse-width modulated)](http://www.sumidacrossing.org/LayoutControl/DCC/DCCMotorControl/PWM/)
speed control.
There is no [DCC](https://en.wikipedia.org/wiki/Digital_Command_Control)
digital control. Only simple, 40-plus-years-old analog voltage, 0 to
12VDC speed control.  As a result, this device was just a few transitors and
looked quite simple to understand and fix.



 
Simple 0-12VDC motor control
 
estimated load 100mA for testing
http://www.sumidacrossing.org/LayoutElectricity/ModelTrainPower/DCPowerReqs/
http://cs.trains.com/mrr/f/88/t/26312.aspx


ngspice manual v26
http://ngspice.sourceforge.net/docs/ngspice26-manual.pdf

pspice format
http://www.ee.bgu.ac.il/~spice/Additional/pspcref.pdf
http://www.stuffle.net/references/PSpice_help/model.html

guide to using kicad w/spice
https://mithatkonar.com/wiki/doku.php/kicad/kicad_spice_quick_guide
http://ngspice.sourceforge.net/ngspice-eeschema.html

Kicad/eeschema manual
http://docs.kicad-pcb.org/stable/en/eeschema.html#hierarchical-schematics


http://ngspice.sourceforge.net/ngspice-eeschema.html

B-Sources
http://ltwiki.org/?title=B_sources_%28complete_reference%29


Motor App Note:
https://www.precisionmicrodrives.com/content/ab-025-using-spice-to-model-dc-motors/
https://www.precisionmicrodrives.com/product/106-002-6mm-dc-motor-12mm-type
https://www.precisionmicrodrives.com/wp-content/uploads/2016/02/ab-025-dc-motor-spice-netlist.original.pdf

http://www.sumidacrossing.org/LayoutElectricity/ModelTrainPower/DCTrainMotors/DCMotorTechHistory/?fbclid=IwAR3gh7ca2kTV5hN_iBj_b9WjjDifBdtKTDtCiz0WR_9-7jG4sRP5sOpeYvY
https://www.slideshare.net/TsuyoshiHorigome/simple-model-of-dc-motor-using-ltspice
https://www.instructables.com/id/Simple-controllers-for-DC-motors-inc-PWM-inertia/

