---
layout: page
title: TheStumbler
subtitle: Ramblings of The Stumbling Engineer
permalink: '/index.html'
css: '/mycss/recent-activity.css'
---

## Latest Activity

<!--
<table class="page-header">
  <tr>
    <td>Projects</td>
    <td>LATEST ACTIVITY</td>
    <td>Blogs</td>
  </tr>
</table>
-->


{% assign sorted_forward = site.documents | sort: 'date' %}
{% assign sorted = sorted_forward | reverse %}
{% for doc in sorted %}

{% if doc.category ==  'blog' %}
<table class="myouter myouter-blog">
  <tbody class="mybody">
  <tr class="myrow">
  <td class="mycol-date"><div>
    <table class="mydate mydate-blog">
      <tr class="mydrow"><td class="mydatetext mydow">{{ doc.date | date: "%a" }}</td></tr>
      <tr class="mydrow"><td class="mydatetext mymonth">{{ doc.date | date: "%e" }}&thinsp;{{ doc.date | date: "%b" }}</td></tr>
      <tr class="mydrow"><td class="mydatetext myyear">{{ doc.date | date: "%Y" }}</td></tr>
    </table>
  </div></td>
  <td class="mycol">
    <table class="mylist myblog">
    <tbody class="mybody">
      <tr class="mytitle">
        <td class="mytext" align="left">
          <a href="{{ doc.url  }}"> 
          {{ doc.title }}
          </a>
        </td>
        <td class="myimg" rowspan="2">
          <img src="{{ site.avatar }}" />
        </td>
      </tr>
      <tr class="mydescr">
        <td class="mytext2">
          {{ doc.description }} 
        </td>
      </tr>
    </tbody>
    </table>
  </td>
  </tr>
</tbody>
</table>

{% endif %}

{% if doc.collection ==  'projs' %}
{% if doc.category ==  'alaska' %}
<table class="myouter myouter-blog">
  <tbody class="mybody">
  <tr class="myrow">
  <td class="mycol-date"><div>
    <table class="mydate mydate-blog">
      <tr class="mydrow"><td class="mydatetext mydow">{{ doc.date | date: "%a" }}</td></tr>
      <tr class="mydrow"><td class="mydatetext mymonth">{{ doc.date | date: "%e" }}&thinsp;{{ doc.date | date: "%b" }}</td></tr>
      <tr class="mydrow"><td class="mydatetext myyear">{{ doc.date | date: "%Y" }}</td></tr>
    </table>
  </div></td>
  <td class="mycol">
    <table class="mylist myalaska">
    <tbody class="mybody">
      <tr class="mytitle">
        <td class="mytext">
          <a href="{{ doc.url  }}">
          {{ doc.title }} 
          </a>
        </td>
        <td class="myimg" rowspan="2">
          <img src="{{ doc.image }}" />
        </td>
      </tr>
      <tr class="mydescr">
        <td class="mytext2"> 
          {{ doc.subtitle }}
        </td>
      </tr>
    </tbody>
    </table>
  </td>
  </tr>
</tbody>
</table>
{% else %}
<table class="myouter myouter-proj">
  <tbody class="mybody">
  <tr class="myrow">
  <td class="mycol">
    <table class="mylist myproj">
      <tbody class="mybody">
      <tr class="mytitle">
        <td class="myimg" rowspan="2">
          <img src="{{ doc.image }}" />
        </td>
        <td class="mytext">
          <a href="{{ doc.url  }}">{{ doc.title }}</a>
        </td>
      </tr>
      <tr class="mydescr">
        <td class="mytext2">
          {{ doc.subtitle }} 
        </td>
      </tr>
      </tbody>
    </table>
  </td>
  <td class="mycol-date"><div>
    <table class="mydate mydate-proj">
      <tr class="mydrow"><td class="mydatetext mydow">{{ doc.date | date: "%a" }}</td></tr>
      <tr class="mydrow"><td class="mydatetext mymonth">{{ doc.date | date: "%e" }}&thinsp;{{ doc.date | date: "%b" }}</td></tr>
      <tr class="mydrow"><td class="mydatetext myyear">{{ doc.date | date: "%Y" }}</td></tr>
    </table>
  </div></td>
  </tr>
  </tbody>
</table>
{% endif %}
{% endif %}

 
{% endfor %}
 
