---
layout: post
title: On Drawing Squids and Circuits
---
A squid?  An octopus?  Well, a squid typically has 8 legs (or arms) and 2 tentacles, whereas an octopus has just 8 legs.  Believe it or not, they are a popular dish here in Seoul. Squids are eaten in all sorts of ways: stir fried with an atomic pepper sauce, boiled in stews, dried into jerky, and even raw with sesame oil.  It's not one of my favorite foods, but it has served as the inspiration for my next project.

## Let's Draw!

We can make a simple squid using only basic geometrical shapes, such as circles and rectangles. Although I'm not an artist, after a lot of failures and editing I came up with the following sketch.  I studied a lot of cartoon squids, photos of real squids, and sought feedback from friends.  And if you think this looks silly, you should see some of the ones I rejected!  Maybe that's a good topic for another post.

![DrawSquid](/images/squid-how-to-draw.png)
<i><center><a href="/images/orig/squid-how-to-draw.png">Click here to see larger version</a></center></i>

<div class="message">
<ul>
<li>The head is a 240 degree wedge of a 130 mm diameter circle</li>
<li>The legs are a 160 degree wedge of a 220 mm diameter circle</li>
<li>The center of the leg circle is at the bottom edge of the head circle</li>
<li>The eight legs are 20 degrees of arc each, separated by a narrow groove</li>
<li>An imaginary 160 mm diameter circle sets the depth of these grooves</li>
<li>It also defines the length of the two 40 mm wide tentacles</li>
</ul>
</div>

## Has The Stumbler gone crazy?
No, not yet.  I am in fact designing a printed circuit board (PCB) that will be squid-shaped.  This is not only a blatant gimmick to draw attention to my product, but my circuit layout matches quite well with the shape of a squid, at least a cartoon-like squid.  There are a lot if I/O connections in my design, ten groups of them actually.  Assigning one I/O group to each of the squid's legs is not entirely an inefficient approach, anticipated arguments from the "PCBs are always rectangles" camp aside. There is also a trade off between making the design appear as a realistic squid and making it reasonable to manufacture, which is why I made my squid cartoon-like. I think the result here is a good compromise between appearance and manufacturability.  However the final verdict on the latter will come soon from my PCB shop. I expect some bumps along the road as my polar coordinate system butts heads with the entrenched world of Cartesian coordinate systems.

## How big is a squid?
As long as the relative ratios of the dimensions are maintained, the absolute numbers aren't important.  The board will look like a cartoon squid whether it's 10 cm tall or 10 meters tall.  But I've arrived at the preliminary dimensions above, after considering all the electronic components that I'll be using, especially the I/O connectors.  What drives the size?  A few key constraints drive the overall size.

The linear (side to side) dimension the connectors
: This sets the arc length of each leg, and hence the diameter of the leg circle.  With a diameter of 220 mm, each leg's arc length is about 36 mm, and the tentacles have been set to a width of 40 mm.

The size of the user interface elements
: This was a secondary factor, because once the leg circle diameter is fixed, the head diameter is somewhat fixed by esthetic constraints to appear squid-like.  The 4x20 LCD array chosen, and the three user pushbuttons selected require the head circle be approximately 130 cm as shown.  This is a reasonable size, and the resulting squid is quite recognizeable.  If we used a larger screen and a full numeric keypad, for example, would have required a much larger area, or if we used only a joystick and a buzzer wouldn't need much area at all.  But either of these choices would have distorted the shape of the squid so much, it would not even be a squid anymore.

The components __and their interconnections__ have to fit on the board
: This is, of course, absolutely essential, or else the board is useless.  Historically, I've always been guilty of trying to squeeze too many parts onto a board.  The PCB layout engineers I've worked with over the years have always "educated" me on this point, <del>screaming</del> patiently teaching me how to allow plenty of open space between components.  I have hopefully learned my lesson.  I know the connectors and user interface will all fit, as this is guaranteed by meeting the above two constraints.  I'm confident the actual electronics and their interconnections will fit as well, a point I will confirm soon as I begin to route the final PCB design.

## Can I carry it?
In electronics these days, small devices are all the rage.  Manufacturers spend millions of R&D dollars shaving off just one millimeter from the thickness of their latest smart phone or laptop.  So while naturally I would like my product to be small and trendy, it's not going to happen.  Fortunately, the applications for my product don't demand extraordinary thinness.  And even if something is only 2 mm thin, if it's 5 meters square, it is going to be inconvenient to use, much less carry around.  You can already see from the sketch above that each side is over 200 mm long.  That's not unwieldy, but it's larger than a box of Macaroni and Cheese.  Consider how my squid circuit board compares to a few common flat items of similar size:

| ITEM | WID | HGT | WID | HGT | 
|:---:|:---:|:---:|:---:|:---:| 
| Note 4 + case | 84 | 157 | 3.31 | 6.18 |
| Mac & Cheese | 92 | 185 | 3.6 | 7.3  |
| US "note" (half A) | 140 | 216 | 5.5 | 8.5 |
| ISO B5  | 176 | 250 | 6.93 | 9.84  |
| mySquid | 220 | 240 | 8.66 | 9.45 |
| US "gov letter"  | 203 | 267 | 8.0 | 10.5 |
| US "letter" (A) | 216 | 279 | 8.5 | 11.0 |
| ISO A4  | 210 | 297 | 8.27 | 11.7 |
| Folded Men's T-shirt  | 241 | 330  | 9.5 | 13.0  |
|==========
|| mm | mm | in | in |

![FlatThings](/images/flat-things.png) 
<i><center><a href="/images/orig/flat-things.png">Click here to see larger version</a></center></i>

I've been using a B5 spiral bound notebook to keep notes on this new project, and I was hoping that the final circuit board would be smaller than one B5 page.  You can see in the figure above, it's close, but two of the legs are outside the page boundary.  Bottom line?  I'd like to see it smaller.  I have a few tricks I could use with the I/O connector legs to squeeze it slightly smaller than B5, if the rest of the circuit could fit.  Otherwise, I believe the current size can be reasonably carried.

