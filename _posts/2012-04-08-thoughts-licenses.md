---
layout: post
slug: thoughts-licenses
status: publish
title: Thoughts on licenses
wordpress_id: '592'
categories:
- Computers and Technology
- Deep thoughts
- Rant
---

_I was going to write this post here, then I thought I'd post it at the Van Patten Media blog, then I changed my mind and cancelled the whole post. Finally, I've decided to write a shorter version of my thoughts here. Bear with me._

I've been thinking a lot lately about open source software licenses. Aside from using open source all day err' day, Van Patten Media has also released several open source software components; most of these in connection with WordPress.

So why think about licenses? Well, they're the framework that defines a piece of open source software. Essentially they are what opens it. And when VPM has been so active in ensuring compliance with the open source ecosystems we're apart of (our publicly available plugins and theme utilities are entirely GPL or GPL-compatible, as circumstances dictate) I get annoyed when other services in this same ecosystem (the WordPress ecosystem, usually) violate what I believe is the spirit of the GPL, the license that governs most WordPress activity.

What leads me to feel this way? Three things:

### Dual-licensing of themes.

Admittedly the Software Freedom Law Center has [given the thumbs-up to dual-licensing themes](https://wordpress.org/news/2009/07/themes-are-gpl-too/), under the logic that the PHP files require WordPress to run, but the CSS/images/javascript can stand alone. They have valid technical reasons for their assessment of why PHP code in a theme is assuredly GPL, but I think their analysis of static content is critically flawed.

Much in the same way that removing WordPress removes the functionality of a theme, removing a theme's static content removes the very essence of what makes it unique and usable. Without (at the very least) CSS, a theme can hardly be considered a "theme" at all. And the GPL has this important passage:

> If identifiable sections of that &#91;modified&#93; work are not derived from the Program, and can be reasonably considered independent and separate works in themselves, then this License, and its terms, do not apply to those sections when you distribute them as separate works. **But when you distribute the same sections as part of a whole which is a work based on the Program, the distribution of the whole must be on the terms of this License**

This is taken from [section 2](https://www.gnu.org/licenses/gpl-2.0.html), which is the section that initiates virality. And to my mind, that passage sets it up quite clearly that GPL is all or nothing, unless the components are distributed separately. (The emphasis above is mine.)

### Misleading users

This one is a personal pet peeve. Certain theme repositories that will not be named lead users to believe that their WordPress theme purchases can only be used a limited number of times before they must purchase new licenses.

Remember how [WordPress themes are GPL](https://wordpress.org/news/2009/07/themes-are-gpl-too/)? Even if you don't share my opinion that all components of publicly distributed themes should be GPL (and admittedly, many do not) this practice is still misleading. While you may be restricted by a secondary license on reuse of static content, make no mistake: **you can use theme PHP files as many times as you want to.** Any copy that confuses users and leads them to believe otherwise is morally suspect and just plain shady.

### Paywalls

This last issue is another one that bothers me (and I know others): the issue of the paywall. It's an incredibly touchy issue, as paywalls (or perceived paywalls) are probably the number one way WordPress developers can create quick revenue streams.

My concern is that paywalls, in congress with the issues I've mentioned above, are antithetical to the openness and virality that the GPL is designed to promote.

Yes, the GPL permits charging for distribution. The GNU website even has a [fascinating article](https://www.gnu.org/philosophy/selling.html) encouraging individuals to charge for their open source software. But it's key to understand their perspective: they're encouraging you to charge so as to support the community around the program and donate to future developments. In fact, their article assumes you're charging for _redistribution_. In their scenario, the software is already out and available in the public sphere, ready to be used and picked apart by those with the know-how. As a redistributor, you're just helping to make it more readily available.

In the WordPress ecosystem, this is rarely the case. Software developers _are_ the distributors, so you have no choice but to pay to get it from the source. While this is permitted by the letter of the license, I think it's a violation of the spirit of the license, which is designed to perpetuate the spread of free software, not lock it behind a door.

To me, the paywall is the manifestation of an attitude I get from many WordPress theme and plugin developers: the GPL (and licensing) is just an inconvenience; a requirement from on high to satisfy some arcane legal nonsense. To me, the paywall is the physicalization of the search for loopholes in the license so you can squeeze more money out of your end users while consolidating control and restricting access.

And furthermore, I'm frustrated by the services that refuse to sell me a theme or plugin without also selling me some sort of support package that I don't need. Frankly, I'm not sure that is at all within the letter of the GPL. Forcing me to buy bundles with support and plugin access is price gouging, and taking advantage of end users. Sell support separately.

### Ultimately...

I would love nothing more than to see plugin and theme developers start developing their wares out in the open on Github or their own code repositories. I would love to see "purchase upgrades" or "buy this theme/plugin" become a thing of the past.

The emphasis should be on personalization. Upselling is the name of the game, right? Instead of asking users to spend $200 on a theme, why not spend $200 and take an hour or so with every user to actually help them get their website live. Offer more than just "support when it breaks" but "support before you need it." Be the concierge for your product.

Admittedly my opinions on licensing are a bit extreme in the WordPress ecosystem. Even some members of the core team have expressed opinions that are contrary to my own. _And that's okay._

But when you set out to make a buck, and you're doing it on the backs of hundreds if not thousands of folks who collectively built a piece of software that your creation depends on, give it some thought... are you making your thing in the most ethical way possible? Are you treating your customer with respect and without misleading them? Are you contributing to the software ecosystem that you're apart of?

If you can't answer yes to those questions, you may need to stop and seriously re-examine your approach. I know we have at Van Patten Media, and I sleep better at night for it.
