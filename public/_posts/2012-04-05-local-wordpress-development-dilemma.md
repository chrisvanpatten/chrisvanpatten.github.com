---
date: '2012-04-05 23:24:06'
layout: post
slug: local-wordpress-development-dilemma
status: publish
title: Local WordPress Development Dilemma
wordpress_id: '581'
categories:
- Computers and Technology
---

My current web development workflow is a little sloppy, I admit. Traditionally, you have four stages: dev, QA, staging, and production. My workflow completely eliminates one of those stages (QA) and combines two (dev and staging are just one stage for me). And–the pièce de résistance–I don't keep my combined dev/staging setup on my local machine; it's all on my remote server.

Sure, it works... but it's not ideal (as [Paddy](http://paddy.io/) has been very quick and all too eager to point out). And as I'm on the hunt for a new text editor (my beloved Espresso 1.x is not Lion-friendly) and get to know Git better, I've decided to overhaul my development workflow (and eventually institute the changes across [Van Patten Media](http://www.vanpattenmedia.com/)... I'm sure [Peter](http://www.peter.upfold.org.uk/) will be happy to see me attempting to standardize this process a bit!). **The goal?  Local dev, remote staging and production, with deployment between the three handled by Git and Git hooks** (as much as possible) **with Vagrant handling the local server environment** (as opposed to MAMP or something like that).

Now the conventional wisdom is "just install WordPress and go wild!" But remember–Van Patten Media is primarily dealing in WordPress, so there are a few hiccups along the way (I love WordPress, but it's making this a pain in the neck!). Among them:

  1. WordPress sets the site URL in the database... so every time I want to push database content between `dev.*`, `staging.*`, and the production site, I need to change that item in the database.
  2. Whenever you insert an image in the editor, it uses the absolute URL (e.g. `site.com/path/to/image.ext`). Remember that last item? Same situation, but even more fun: I'll need to scan _every post_ for the site's hostname and switch it out based on whether I'm at `dev.*`, `staging.*`, or on production.
  3. I like to arrange my WordPress projects in a specific way, because I often have custom `humans.txt`/`robots.txt` files and `maintenance.php` files that live outside the theme root. You can see an example of this at the [Github repo for the Van Patten Media website](https://github.com/vanpattenmedia/vanpattenmedia.com).
  4. I absolutely do not want to keep WordPress core (or plugins) in version control. WordPress core needs to be managed separate for each website, and plugins as well (updates to custom developed plugins are handled by a local update API I have in place).

If you're doing a little critical thinking, you can see where things start to fall apart... it's all in steps 3 and 4. It should be easy to handle database syncing with tools like [Liquibase](http://www.liquibase.org/) or database diff tools (and that's really only for merging staging into production, I think). The problem is what files I like to keep around, and what files I don't like to keep around. The natural solution would be just to set up a WordPress install and symlink the theme folder, but remember how I keep other things around outside the theme folder? Enter frustration, stage right.

So I appeal to you, internet community. What's the best way to handle this sync? The ability to have a local Vagrant-managed replica of my server, send the `vagrant up` command from a project directory, and get a fully working dev environment _without ever seeing a WordPress core file_ is my ideal situation.

And then of course, that introduces another question–how do I handle this sync up to the server (and between staging and production)? It'd be one thing if I just had the remote theme folder set as the Git remote, but, again, that's just not how I'm handling things. Ideas?

Thanks!