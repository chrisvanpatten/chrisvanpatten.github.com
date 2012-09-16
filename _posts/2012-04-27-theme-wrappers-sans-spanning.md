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

First, create a new file: head.php. Head.php is a partial that contains the entire content of the `<head>` HTML tag, and the opening and closing tags themselves. Now where that markup would normally be included in header.php, I just add `<?php get_template_part('head'); ?>` to pull in the head.php partial.

There's no real reason to do this other than keeping a lot of code out of my base.php file and keeping things a little cleaner. I think it just overall makes it easier to parse through a file and get to relevant content faster, but that's just me. And because the `<head>` tag gets opened and closed right within the head.php partial, you don't have to worry about spanning. I also like it because I can easily copy head.php between projects that often start with the same basic needs.

Now in your header.php file, copy everything over to your base.php. Keep you header.php file, you'll probably want it, but ignore it for now. Replace your call to get_header with what you just copied. Do the same with get_footer and footer.php.

So now your base.php file is a whole lot bigger. But we can trim it back down by looking in your header and footer (in your markup, not those files yet) for the actual header and footer markup that closes itself. _That's_ what you want to copy back into your header and footer files, and replace that markup in your base.php file with get_header and get_footer.

Here's a gist that shows the finished base.php.

<script src="https://gist.github.com/2509424.js?file=base.php"> </script>

I hope this makes some sense. Let me know if you have any questions and what you think of this method!