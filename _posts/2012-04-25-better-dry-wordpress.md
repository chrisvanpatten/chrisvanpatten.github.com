---
layout: post
slug: better-dry-wordpress
status: publish
title: Even better DRY for WordPress
wordpress_id: '617'
categories:
- Computers and Technology
- Projects
- Web Design
- WordPress
---

So I posted a week or so ago about [DRY themes for WordPress](http://www.chrisvanpatten.com/blog/2012/04/dry-wordpress-themes/). Turns out, this has been done already (I thought it might have been), and in an even more awesome way that avoids my conditional-filled logic statements.

Check out [scribu's Theme Wrappers](http://scribu.net/wordpress/theme-wrappers.html), the most brilliant handling of this issue yet.

With a little bit of extra code in your functions.php file (or in a plugin–after a little more testing I'll probably incorporate this into the [rach5-helper](https://www.github.com/vanpattenmedia/rach5-helper)) you have a perfect setup that lets you define a base php file (wrapper.php in his example, but I prefer base.php) and use WordPress standard template names to fill in the gaps, saving you time and energy and keeping you from needing to maintain a 20 line conditional check.

This is an awesome system and absolutely worth checking out if easily maintainable themes is something that matters to you!
