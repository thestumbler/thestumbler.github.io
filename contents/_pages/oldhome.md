---
layout: page
title: TheStumbler
subtitle: Ramblings of The Stumbling Engineer
permalink: '/index.html'
date: 2015-10-01
published: false
---

## Latest Blog Post

  {% assign post = site.posts.first %}
  <article class="post-preview">
    <a href="{{ post.url | prepend: site.baseurl }}">
	  <h2 class="post-title">{{ post.title }}</h2>
	  {% if post.subtitle %}
	  <h3 class="post-subtitle">{{ post.subtitle }}</h3>
	  {% endif %}  
    </a>

    <p class="post-meta">
      Posted on {{ post.date | date: "%B %-d, %Y" }}
    </p>
 
    <div class="post-entry">
      {{ post.excerpt }}
      <!-- {{ post.content | truncatewords: 50 | strip_html | xml_escape}} -->
	  <a href="{{ post.url | prepend: site.baseurl }}" class="post-read-more">[Read&nbsp;More]</a>
    </div>
 
  </article>
 
