---
date: '2012-01-30 21:47:24'
layout: post
slug: comma-separated-tagging-delicious-chrome-extension
status: publish
title: Comma-separated tagging in the Delicious Chrome extension
wordpress_id: '556'
categories:
- Computers and Technology
---

Do you use the [Delicious](http://www.delicious.com/) extension [for Google Chrome](https://chrome.google.com/webstore/detail/mnaelnkmidnndgikjbiifihgklnocljd)? I am (still, 6 years later) a Delicious-lover, but the Chrome extension has been—[admittedly](http://blog.delicious.com/2012/01/update-on-the-browser-extensions/)—neglected while the team builds up other elements of the service to modern standards.

The current plugin is a rebuild of the previous plugin that works with current APIs, but still has a few holdovers from the Yahoo days. Unfortunately, one of those holdovers is the enter-to-autocomplete function, which still retains the space separator instead of the recently instated comma separator. Fortunately, it's a quick fix. **Follow the steps below to make enter-to-autocomplete easy again!**

### Fixing enter-to-autocomplete

1.  First you need to **find where the extension is located on your computer's hard drive**. Here are some probable paths:
    +   **Older Windows:** `C:\Documents and Settings\*UserName*\Local Settings\Application Data\Google\Chrome\User Data\Default\Extensions`
    +   **Windows 7:** `C:\Users\*UserName*\AppData\Local\Google\Chrome\User Data\Default\Extensions`
    +   **Mac OS X:** `/Users/*UserName*/Library/Application Support/Google/Chrome/Default/Extensions`
2.  You'll need to figure out which folder is the Delicious extension next.
    +   Take note of the ID: **mnaelnkmidnndgikjbiifihgklnocljd**
    +   To check yourself, open your Chrome extensions list by [clicking here](chrome://settings/extensions) (careful, it'll take you to a new window). Find the Delicious extension in that list, and click the arrow to see a few more options appear, as seen in the picture below.
    +   [![](http://www.chrisvanpatten.com/wp-content/uploads/2012/01/Preferences-Extensions-300x51.png)](http://www.chrisvanpatten.com/wp-content/uploads/2012/01/Preferences-Extensions.png)
3.  See that ID? That's the folder you want in your Chrome extensions directory. Open it up, and you'll see another folder (hopefully called **1.1_0**). Open _that_ up.
    +   You should have a list of files that looks something like this:
    +   ![](http://www.chrisvanpatten.com/wp-content/uploads/2012/01/1.1_0.png)
4.  Still with me? Great! Now we're at the good part. Open the file called **del-chrome.js** in your text editor of choice.
5.  Search for the text `delimChar` - there are two instances of it in the file, one at line 838, and another at 1052. It's pretty easy to guess what `delimChar` does - it sets the character that delimits the tags! Here's how it looks now:
> `delimChar : " "`
**And here's what you should change it to:**
> `delimChar : ","`
6.  Got it? Changed in both places (lines 838 and 1052)? Perfect. **Save that file.** You're almost done.
7.  **Restart Chrome!** That's it! You're done! **Open up a page and enter-to-autocomplete to your heart's content.**

Hopefully Delicious launches an updated extension quickly, but in the meantime this is a quick way to speed up your tagging and bookmarking.

Thanks for stopping by, and **let me know if you have questions in the comments below!**