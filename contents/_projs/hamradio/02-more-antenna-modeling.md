---
layout: page
title: More Antenna Simulations
subtitle: Streamlining the Process
image: "/images/hamradio/smith-chart.png"
bigimg: "/images/hamradio/g5rv-sketch.png"
show-avatar: true
date: 2019-01-31
comments: true
collection: proj
category: hamradio
seq: 2
---

I made some improvements on my NC antenna 
[description file](/myfiles/hamradio/daegu.nc.txt).
I found it cumbersome to keep one file for each antenna style,
because what if I wanted to change other details of the simulation,
such as the model of the building? There would have been a lot of
code replicated in each file.

After pondering it some, and wishing that NC was a full C compiler,
I came up with an organization of the file that streamlines the 
experimentation process. Well, that and some bash command line tricks.

## Main NC File

Here is the basic structure of my .NC file, omitting all the variables and
details, with a brief explanation of each section. To begin, the function
`model()` is special in NC and describes the all geometries of wires and
sources to be simulated. I organized the function into the groupings shown,
trying to separated each item logically so it can be tweaked independently. 

```cpp
model ( "daegu-site" ) {
// 1. Describe some candidate antennas
  // (1a) Setup G5RV antenna details:
  // (1b) Setup Dipole antenna details:
  // (1c) Setup Rhombic antenna details:
  // (1d) Setup Horizontal Loop antenna details:
```
This first section defines all the antennas of interest for this particular site.
We are just setting up the sizes and details of each antenna, not actually
instantiating it in the simulation at this point. And for code editing convenience,
you can define several of the same types of antennas, each one overwriting 
the previous one - only the final one "takes".

```cpp
// 2. Describe the Daegu site details
```
This section defines the site, in this case the building dimensions
and a small hut located on the roof. I eventually gave up using this in the
real simulation, but it was helpful to draw it in the beginning to see that
the antennas were oriented properly.

```cpp
// 3. Now make the things to simulate
  // (3a) Ground
  // (3b) Nearby things
  // (3c) Antenna
```
The next section actually creates the items for use by the simulation.
The ground is defined, any nearby things like buildings or ground planes,
and of course, the antenna itself.
```cpp
// 4. Simulation controls
  // (4a) set frequency(ies)
}
```
This last section of the main function `model()` just defines which frequencies 
the simulation should use. If desired, other simulation controls would go here.
The HF ham radio bands are all listed, and can be commented in or out as
appropriate.


The remaining portion of the file are functions I wrote that attempt to
isolate all the global variables, and make it somewhat easy to tweak 
antenna geometries by editing only one line of code in the main function.
It's a crude attempt at isolating the antennas in objects or data structures.

```cpp
// These functions generate a G5RV-style antenna
void g5rv_wire_set( real erad, real frad, real fgap ) { ... }
void g5rv_elem_set( real elem, real esag, real flen ) { ... }
element make_g5rv( transform t ) { ... }

// These functions generate a dipole antenna
void dipole_wire_set( real erad ) { ... }
void dipole_elem_set( real elem, real esag ) { ... }
element make_dipole ( transform t ) { ... }

// These functions generate a rhombic antenna
void rhom_wire_set( real erad ) { ... }
void rhom_elem_set( real fgap ) { ... }
element make_rhombic ( transform t ) { ... }

// These functions generate a horizontal loop antenna
void loop_wire_set( real erad ) { ... }
void loop_elem_set( real fgap ) { ... }
element make_loop ( transform t ) { ... }

// These functions generate the building
void bldg_initialize() { ... }
real bldg_apex_height_get() { ... }
real bldg_hut_roof_height_get() { ... }
void bldg_corners_get( vector *corn ) { ... }
void bldg_draw( transform t ) { ... }
```

## Bash Tricks

Now that I have a well-organized NC file, I needed to be able to quickly simulate it
and see the output data. I haven't learned any more from the author yet about command 
line usage, but I figured out by trial-and-error that I can at least pass the NC file
to the program as the first argument on the command line. That would look something
like this:

```bash
$ /Applications/cocoaNEC\ 2.0.app/Contents/MacOS/cocoaNEC\ 2.0 filename.nc &
```

That fires up cocoaNEC as a child process, so you can keep using the terminal window
for editing, etc. When you're done, you can kill cocoaNEC by sending it SIGKILL:
(Edit: sending SIGKILL seems to clean it up more thoroughly than SIGTERM):

```bash
$ pkill -SIGKILL cocoaNEC
```

If we want to avoid the messages from the background task, add this to your
`.bash_aliases` file as follows:

```bash
alias cckill='pkill -SIGKILL cocoaNEC'`
function ccnec() {
  ( /Applications/cocoaNEC\ 2.0.app/Contents/MacOS/cocoaNEC\ 2.0 "$@" & )
}
```

Now you can start a simulation run with 

```bash
$ ccnec filename.nc
```
and stop it with
```bash
$ cckill
```


## Other approaches 

Some more links to put here for reference, in case I want to revisit this
in the future. But probably the first thing I would do is see if I can use the 
[m4 preprocessor](https://en.wikipedia.org/wiki/M4_(computer_language)) 
to easily combine different items from a bunch of small,
partial NC files, on-the-fly.  I've used m4 in a similar manner for another
task recently, and it should be simple to setup.

* [GNU-NEC](http://users.tpg.com.au/micksw012/gnu-nec.html)
* [nec2++](http://tmolteno.github.io/necpp/)
* [perl/tk NEC](http://mirror.thelifeofkenneth.com/lib/electronics_archive/A%20Perl-Tk%20Package%20for%20NEC%20Based%20Antenna%20Design.pdf)
* [xnecview](http://www.huge-man-linux.net/man1/xnecview.html)

It looks like this NEC2C project is command line based, and might be helpful
if you need to run from the command line.

* https://code.google.com/archive/p/nec2c/
* https://github.com/cvvs/nec2c
* https://github.com/realpsyence/cocoaNEC2/tree/master/nec2c.rxq-0.2-cocoa
* https://github.com/tmolteno/necpp

