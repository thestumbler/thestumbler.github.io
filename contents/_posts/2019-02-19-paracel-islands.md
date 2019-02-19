---
title: "Paracel Islands?"
description: "Or how to properly format addresses"
bigimg: /images/addr-paracel-islands-aerial-view.jpg
layout: post
category: blog
date: 2019-02-19
---

This weekend I had several addresses which I had copied and pasted on my computer for a report I'm working on.
They were in various, less-than-perfect formats.  But I happen to know that the Korean Postal service operates
a [website](http://www.juso.go.kr/support/AddressMainSearch2.do) that is perfect for my needs.  
You input a casually formatted address, in either Enlish or Korean, 
and it gives you the correct and acceptable format, also in both English and Korean.

![post-office-search-site](/images/addr-post-office-site.png)
_Korea Post Office Address Search Page_

Being handy with the computer, I decided to automate the process and ~~wasted many hours~~ had a wonderful 
experience improving my Python, BeautifulSoup, and Selenium skills.  Actually, I didn't waste too much time
on the main task, but on a completely frivolous issue that caught my attention.  The Postal site returns
the coordinates of the address, presumably in latitude / longitude format.  However, since I could easily
get the actual coordinates of these addresses using other mapping services, I compared the two.
the Post Office numbers seemed wrong - wildly wrong.  


To give an example, here are the coordinates for a McDonald's located on Jeju Island next to the airport.
You can't tell it from just one point, but overall they were spread out more-or-less like lat/long values.  
Just their scale and reference point were all wrong.

| McDonald's Jeju |          Actual Position        |         Postal Position        |
|             ---:|                             ---:|                            ---:|
|   Longitude     |  <code>126.4927802454370</code> | <code>371925.0143263740</code> |
|   Latitude      |  <code> 33.4949444649723</code> | <code>550243.2740684800</code> |

After a few false starts trying to calculate the conversion factors, I stumbled onto a method 
used in the field of cartography, when one tries to back out the transformation between sets 
of data points which used different reference systems.  That whole formal 
process was overkill, but it gave me the idea of how to find it manually.
I start with both data sets, and normalize the points to their centroid, or it's 
[barycenter](https://en.wikipedia.org/wiki/Barycenter) ( _new word for the week_ ).
And then plot them together to visually see the mis-matches.

This was easy to do in Excel, since I only had a handful of sample points. I then tinkered with 
the scale factor(s) and offsets.  This slowly brought the points into convergence, or as near as 
I wanted to fool with it.  I think if I really want to, I could come much closer using more 
carefully select sample points, and more of them. Here is the plot of the points after I 
transformed them (orange points are the Postal System's coordinates).

![lat-long-comparison](/images/addr-lat-lon-comparison.png)
_Latitude / Longitude Comparison, Actual vs. Postal Positions_

Here are the scale and offset factors needed to get those to match were interesting:


|              |       Scale Factor   |          Offset       |
|          ---:|                  ---:|                   ---:|
|   Longitude  |   <code>27380</code> |   <code>112.91</code> |
|   Latitude   |   <code>33000</code> |   <code> 16.80</code> |


To convert _Postal_ lat/lon into _real_ lat/lon, you apply this simple formula:

<code style="color: purple">
LON = (POSTAL_LON / SCALE_LON ) + OFFSET_LON
</code><br/>
<code style="color: purple">
LAT = (POSTAL_LAT / SCALE_LAT ) + OFFSET_LAT
</code>


Notice the huge scale factors, something I might expect if they were integers.
But clearly they aren't.  Not only are the scale factors weird, but they are **different**.
So why was this post entitled [Paracel Islands](https://en.wikipedia.org/wiki/Paracel_Islands)? 
Well, it turns out that is the only feature located at the estimated reference point-zero of 
the Korea Postal Service geodetic system.

![korea-post-point-zero](/images/addr-korea-post-point-zero.png)
_Point-Zero of the Korea Post Geodetic Reference System?_


And despite this side distraction, I did get the 
[script](https://github.com/thestumbler/get-addr.git) working.


