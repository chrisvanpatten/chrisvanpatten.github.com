---
layout: post
slug: dry-wordpress-themes
status: publish
title: DRY WordPress Themes
wordpress_id: '612'
categories:
- Computers and Technology
- Web Design
- WordPress
---

I've been working out a new process for developing WordPress themes and I wanted to share it here before I take it over to the Van Patten Media blog. I'd love to get feedback and tweak it as much as possible!

I've been developing WordPress themes for a lot of years–almost as long as I've been doing professional web development. One of the biggest problems I've run into (especially lately) is writing themes that are easily maintainable.

Sass and Compass have helped in the style sheet department ([see my introduction to them](http://www.chrisvanpatten.com/blog/2012/04/sexy-style-sheets-sass-compass/)) but the WordPress themes themselves still are full of heavily repeated content. What do I mean?

Well, a WordPress theme generally has a few base items:

*   index.php
*   page.php
*   single.php
*   header.php
*   footer.php
*   page-{your-template}.php
*   etc.

"So where's the problem?" you might ask. "Your header and footer are included in every file, and that solves every problem." Yes, but I have one requirement that stumps things: I want no tags spanning across files.

What do I mean? Simple: if I open a `<div>` in one file, I don't want to close it in another. And with header and footer.php files, that's exactly the situation you end up in. You probably open up your `<html>`, `<body>`, and a number of wrapper `<div>`s.

That gets unmaintainable quickly when you're bouncing between multiple projects a day and don't remember what the third closing div tag lined up with in your footer.php file. So I've implemented a new system, visible in the most recent [Rach5](https://github.com/vanpattenmedia/rach5) commits.

This system forgoes the traditional page.php and single.php templates, and instead makes extensive use of conditionals called from index.php. Now if you are familiar with the [WordPress template hierarchy](http://codex.wordpress.org/Template_Hierarchy), you know that conditionals in an index file are doing double the work, as WordPress has already tried to find an appropriate file. But by putting the majority of your theme structure in index.php (think of it as your base file) you save yourself a massive amount of work down the line.

<script src="https://gist.github.com/2430622.js"> </script>

YYou can see in the gist how my files are laid out: header.php now includes the _visible header_ within the `<body>` tag. And I'm now using a new template part, head.php, to serve the `<head>` tag. You can see an example of the [head.php from Rach5 here](https://github.com/vanpattenmedia/rach5/blob/master/head.php) (Note: with this method, you could easily include the `<head>` tag directly in your base file, but I choose not to for maintainability reasons).

Then every time I want to include new content in the "content area" of the site, I have conditionals that determine which file to include. I have two default loop files, loop-page.php and loop-post.php which handle basic loops, and a pg-front.php template part. Calling these conditionals from here causes some extra logic to be executed (duplicating logic that WordPress executed previously, in a way), but caching will make that negligible, and this means I can minimize duplicated template code.

I've only loosely sketched out the concept, but you can see it and try it for yourself by downloading the latest Rach5. I'd love to hear what others think!
