---
date: '2012-04-27 09:52:20'
layout: post
slug: theme-wrappers-sans-spanning
status: publish
title: Theme wrappers sans spanning
wordpress_id: '620'
categories:
- Computers and Technology
- Web Design
- WordPress
---

Last night at the Buffalo WordPress Meetup I did a little talk about theme wrappers. I briefly alluded to the dangers of tag spanning but didn't follow up on it, and when I live-converted a theme to use theme wrappers I didn't convert it to the format I typically use that repurposes header.php and footer.php to help prevent tag spanning. I thought I'd go over it here to help clear that up!

In the final example I showed, where I converted a site to the theme wrapper method live, tag spanning was still in place because I used the get_header and get_footer functions for their typical purpose (and the way I had originally used them in the theme). This is _totally okay_ if that's how you like to work, but I actually ended up modifying that base.php file this morning to make it a little more sane.

Here's how you can do that too.

First, create a new file: head.php. Head.php is a partial that contains the entire content of the