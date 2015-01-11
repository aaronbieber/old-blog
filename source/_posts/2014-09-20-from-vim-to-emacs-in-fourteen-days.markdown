---
title: From Vim to Emacs in Fourteen Days
layout: post
date: 2014-09-20 23:01:25 -0400
comments: true
categories: 
---

Yes, my friends, it is true. After more than fifteen years using Vim, teaching
Vim, proselytizing about Vim, all the while scoffing in the general direction of
Emacs, I've seen the light. The light of Lisp... Or something.

In this post, I am going to illustrate the high points of what is necessary to
make Emacs behave so much like Vim you'll almost forget it's Emacs, except when
it does something so awesome you'll wonder why you didn't try it sooner (or
something so frustrating it gives you reminiscent pangs of Vim).

It's taken me at least the fourteen days described in the title, but with my
help it should only take you two or three. There are some things to get used to,
some new paradigms, and you have to learn a bit of Lisp (Elisp, actually), but
don't be afraid, it's not that hard.

Is this just a phase that I'm going through? Will I get smothered in parentheses
and return to Vim? Maybe. But for now, come with me, learn a little bit of Lisp,
and have some fun.<!--more-->

## Step 1: Get Emacs

``` cl
(add-hook 'evil-mode-hook (lambda ()
                             (turn-on-something)))
```

More things.
