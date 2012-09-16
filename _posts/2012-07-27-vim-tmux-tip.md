---
date: '2012-07-27 10:00:00'
layout: post
slug: vim-tmux-tip
status: publish
title: Get tmux and Vim to play nice
categories:
- Computers & Technology
---

I recently switched cold turkey to **[Vim](http://www.vim.org/)**, in the first part of an effort to move my development environment to apps I could use (in theory) everywhere and trust to have in place for a long time. Sublime Text 2&mdash;which I mentioned using in my [dev setup](http://www.chrisvanpatten.com/blog/2012/06/dev-setup/) post&mdash;is great, but it's only maintained by one guy, it's expensive at $60 for a license, and not available on servers because it's a GUI-based app.

Vim has been around for (literally) decades&mdash;over 20 years, in fact. There's no doubt its development is stable and it'll be reliably available. It's free software (as in beer and speech) and it has an active developer community contributing plugins and neat new improvements. Plus, Vim's unique syntax (once you master it) makes you faster and more efficient than any other text editor available.

I was also interested in running Vim inside **[tmux](http://tmux.sourceforge.net/)**, a terminal multiplexer describing itself as an alternative to GNU Screen. A terminal multiplexer provides a nice alternative to tabs in your terminal emulator (like iTerm or Terminal.app) because

*   "Sessions" are persistent - meaning you can close, or "detach" yourself from a session, and it will (essentially) be frozen while you're gone. Particularly useful for saving your place when working with a server.
*   You can actually have multiple panes visible at once, making it easier to see a several different tasks at once.

With Vim and tmux working side by side, I would be able to edit in one pane, see my asset compilation in another pane, monitor server stats in another tmux tab, and have `git status` visible in another pane. Sort of an ultimate developer HUD.

Unfortunately, Vim and tmux don't play nicely out of the box. They both require lots of keyboard shortcuts to work, and even once you've remapped them so there are no conflicts (your first order of business if you're having trouble) you might still have problems with things being sent incorrectly. In particular, I had trouble with the arrow keys. I use them to navigate between Vim panes, and it was driving me mad not being able to move around fluidly!

After lots of searching around the web though, I finally found two lines of config that were able to get Vim and tmux working together like long time best friends. Arrow keys now work flawlessly! **Here's what I did:**

First, in your .vimrc:
`map <Esc>[B <Down> `

And then in your .tmux.conf:
`set-window-option -g xterm-keys on`

It's important to note that this assumes you have tmux reporting itself as an xterm-compatible terminal (for best color compatibility, you probably should anyway). But once you do this, your problems should evaporate and you'll have an awesome terminal-based development environment going.
