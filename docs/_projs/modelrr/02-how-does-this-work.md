---
layout: page
category: modelrr
title: How does this thing work?
description: Let's re-draw a circuit
seq: 2
date: 2018-12-10
comments: true
tags:
- kicad
- spice
- n-gauge
---


So, how does this thing work? Not exactly as I first guessed:

![schematic-from-conrad](/images/modelrr/conrad1-schematic.png)
*Schematic from Conrad*

![connection-diagram](/images/modelrr/conrad1-connection.png)
*Connection Diagram*

The first thing I noticed was that there is no ground connection. 
Term#1 connects to the train power pack, nominally 12VDC at full speed,
and Term#2 connects to the isolated section of track being controlled.
Obviously this circuit depends on the load of the train's engine,


and my first attempts to model the engine as a simple resistor failed.

It turns out that this circuit depends on the various characteristics 
of the DC motor in the model train engine. Each engine can behave 
differently, based on it's characteristics.

I first assumed that the variable pots controlled two RC time constants, for the two functions.
That much is correct.



 
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

