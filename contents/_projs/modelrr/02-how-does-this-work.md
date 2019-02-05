---
layout: page
title: How does this thing work?
subtitle: Let's re-draw the circuit
image: "/images/modelrr/engine-nose.jpg"
bigimg: "/images/modelrr/pwa-zoomed-two.jpg"
seq: 2
date: 2018-12-10
collection: proj
category: modelrr
comments: true
published: true
---


So, how does this thing work? Not exactly as I first guessed:

![schematic-from-conrad](/images/modelrr/conrad1-schematic.png)
*Schematic from Conrad*

![connection-diagram](/images/modelrr/conrad1-connection.png)
*Connection Diagram*

The first thing I noticed was that there is no direct ground connection. 
Term#1 connects to the train power pack, nominally 12 VDC at full speed,
and Term#2 connects to the isolated section of track being controlled.

Obviously this circuit depends on the load of the train's engine,
and my first attempts to model the engine as a simple resistor failed.
It turns out that this circuit depends on the various characteristics 
of the DC motor in the model train engine. Each engine can behave 
differently, based on it's characteristics.


I didn't have an engine or motor to test with, so I relied on the internet.
Some sites discussing model train engines can be found
  [here](http://www.sumidacrossing.org/LayoutElectricity/ModelTrainPower/DCPowerReqs/)
  and
  [here](http://cs.trains.com/mrr/f/88/t/26312.aspx).
And I found this app note on Spice simulation of a similar
miniature DC motor from [Precision Microdrives](https://www.precisionmicrodrives.com):

 * [Motor App Note AB-25](https://www.precisionmicrodrives.com/content/ab-025-using-spice-to-model-dc-motors/)
 * [6mm DC Motor, Model No. 106-002](https://www.precisionmicrodrives.com/product/106-002-6mm-dc-motor-12mm-type)
 * [Spice Models of AB-25](https://www.precisionmicrodrives.com/wp-content/uploads/2016/02/ab-025-dc-motor-spice-netlist.original.pdf)

Here is the Spice model I ended up with:

![spice-schematic](/images/modelrr/conrad-sch.png)
*Spice Schematic*

This circuit includes the Conrad controller, a model for the engine, and a small circuit 
to test the short-circuit overload protection feature of the controller.
