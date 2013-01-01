---
layout: post
slug: quick-suitcase-fusion-3-tip
status: publish
title: Quick Suitcase Fusion 3 tip
wordpress_id: '576'
---

[![](http://www.chrisvanpatten.com/wp-content/uploads/2012/03/sferror.png)](http://www.chrisvanpatten.com/wp-content/uploads/2012/03/sferror.png)I was working on a mockup today and got this message while in the process of activating a font in Suitcase Fusion 3, my font manager of choice (well, by necessity, but that's another story):

> Suitcase Fusion Client encountered an unexpected error. 83914764

Google lead me to a [forum thread that discussed the issue](http://forums.extensis.com/viewtopic.php?f=30&t=3874), but I wasn't too interested in accepting the thread's "reinstall the program" advice so quickly.

After a bit of playing, I found a solution that was a lot more painless. No guarantees it will work for you, but it's worth a shot!

Simply open your Suitcase Fusion 3 preferences (**⌘**+**comma**), navigate to the **Type Core** tab, and click the **Stop FMCore...** button. That will kill FMCore (the process that handles type activation when Suitcase Fusion is closed) and Suitcase Fusion itself. Then just open Suitcase Fusion again to restart FMCore.

If your setup is anything like mine, you'll be back in business, error-free!
