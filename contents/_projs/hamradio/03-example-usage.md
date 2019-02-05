---
layout: page
title: Sample Simulation
subtitle: An NC file usage example
image: "/images/hamradio/smith-chart.png"
bigimg: "/images/hamradio/g5rv-sketch.png"
show-avatar: true
date: 2019-02-01
comments: true
collection: proj
category: hamradio
seq: 3
---


Using my 
[example NC file](/myfiles/hamradio/daegu.nc.txt){:type="text/plain"}{:target="_blank"}{% comment %}_{% endcomment %}
from the previous post, let's walk through an example simulating a dipole for 40m.

Since we want to make a dipole, we jump right to this section around line 55 of the file:

```cpp
  //================
  // Setup Dipole antenna details:
  //================
  // dipole_wire_set() function arguments:
  // 1. wire radius of main radiators, legs 1 and 2
  dipole_wire_set( #14 );
  // dipole_elem_set() function arguments:
  // 1. length of each leg
  // 2. droop at each end
  // ### the antenna you want needs to be the last one in this list
  dipole_elem_set(  5.0, 0.0 ); // 20m dipole
  dipole_elem_set( 10.0, 2.0 ); // 40m dipole
  ant_angle=-30.0;
```
You can see we have defined a dipole with 10 meter long legs, and a 2 meter 
droop at each end.  It is placed at a -30 degree angle on the roof of the building
(the way I have defined the rotations, the antenna angle is relative to the long 
axis of the building).  The apex height of the dipole, indeed any wire antenna in
this NC file, is given by the hard-coded definition of the building. If you want
to change the height, find this function near the end of the file and edit the 
appropriate variable(s) accordingly. Note that the antenna height is returned
by a call to the function `bldg_apex_height_get()` function. 

```cpp
void bldg_initialize() {
  bldg_hgt = 30; // 10-story building, estimated 3m/story
  bldg_wid = 15;
  bldg_len = 25;
  bldg_hgt_hut = 3; // hut on roof, est 3m tall
  bldg_hgt_mast = 2; // mast height

}

real bldg_apex_height_get() {
  return bldg_hgt + bldg_hgt_hut + bldg_hgt_mast;
}
```
The final portion of the simulation model is to draw, or simulate, the
antenna of interest. Find this section of the file:

```cpp
  //=== (3) Antenna, FINALLY
  // ### uncomment the kind of antenna you want to simulate
  //     (only one can be uncommented)
  // driven=make_g5rv(ta);
  driven=make_dipole(ta);
  // driven=make_rhombic(ta);
  // driven=make_loop(ta);
```

Uncomment the antenna of interest, in this case, the function `make_dipole()`.
And finally, select the desired frequency(ies) of interest.  Since this is 
40m antenna, we will choose 40m only.

```cpp
// ### uncomment the frequency(ies) you want to plot
//     (only four frequencies can be plotted)
//   addFrequency(  1.900 ); // 160m
//   addFrequency(  3.500 ); // 80m
//   addFrequency(  5.348 ); // 60m
     addFrequency(  7.100 ); // 40m
//   addFrequency( 10.140 ); // 30m
//   addFrequency( 14.100 ); // 20m
//   addFrequency( 18.100 ); // 17m
//   addFrequency( 21.100 ); // 15m
//   addFrequency( 24.925 ); // 12m
//   addFrequency( 28.100 ); // 10m
```

Save the file, then from the command line run the cocoaNEC simulation.

```bash
$ ccnec filename.nc
```
Look at the charts and data, make plots, etc. 
Then if desired, make changes in your NC file.
Then you can kill cocoaNEC and restart it again, with your changes.
```bash
$ cckill
$ ccnec filename.nc
```
Wash, rinse, and repeat.

