---
layout: post
title: "Why You Should Give ZSH Another Try"
date: 2013-10-31 08:15
comments: true
categories: 
---
If you're already a big fan of "the Z shell" (`zsh`), you may not need to read 
any further. If, however, you're like me and have spent years in the Bourne 
Again shell (`bash`), it might be time to re-evaluate your choice.

I have used `bash` for a long time and reached a fair proficiency level in it. 
I was doing things like looping over program output, filtering it, using 
utilities like `seq` and `wc` all the time. I could re-run commands from my 
history in more than one way and reverse-search them with Ctrl-R. None of this 
was news to me.

But then someone told me about this Z shell configuration package called "oh 
my zsh," and I decided to dangle my toes into the waters of the Z shell and 
see what it's all about. After all, the OS X terminal drops you into `zsh` by 
default; there must be something to it.

I'm never going back.<!--more-->

To begin, here are some specific reasons you should drop `bash` or `tcsh` or 
`csh` and use the Z shell:

1.  The number one reason to consider `zsh` as a replacement for the shell you 
    already use is ubiquity. You're going to be much more likely to actually 
    find `zsh` on any given machine than newfangled shells like `fish`. If you 
    only ever use your own single personal computer this doesn't matter as 
    much.
2.  The features, oh the features. The bulk of this post will be about these 
    features so I will leave it at this for now. Suffice it to say, there are 
    a couple of options that are so killer that I can never go back to bash.
3.  "oh my zsh" provides a further ecosystem of themes and extensions that 
    other people maintain, giving you some awesome off-the-shelf capabilities 
    as well as a very reasonable framework in which to create your own, if you 
    wish.

Curious? Let's dig in.

## Get Started Right Now

If you're like me, you're more of a *doer* than a *reader*. If you want to see 
what all the fuss is about, here is how you can do that right now:

1.  Make sure you have `zsh` installed. OS X has it by default, CentOS uses it 
    as the default shell. Other flavors of Linux may need a quick install. For 
    Ubuntu, `sudo apt-get install zsh`, for Gentoo `sudo emerge zsh 
    zsh-completion`.
2.  If you want to try "oh my zsh", get it [on the oh-my-zsh Github page](1)

[1] https://github.com/robbyrussell/oh-my-zsh
