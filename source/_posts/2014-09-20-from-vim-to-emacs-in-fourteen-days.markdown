---
title: From Vim to Emacs in Fourteen Days
layout: post
date: 2015-05-15 09:01:25 -0400
comments: true
categories: 
published: false
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

Emacs is available on all major platforms. For Linux OSes, you can get Emacs
from your package manager du jour, i.e. `apt-get install emacs`. There are also
Linux and Windows builds available through a
[local GNU mirror](http://ftpmirror.gnu.org/emacs/) (this link will redirect to
a mirror close to you, in theory).

For OS X (presumptuously the only reason you'd read this section...), you have
three choices: "GNU Emacs for Mac OS X"
[found here](http://emacsformacosx.com/), or the Homebrew build, which is called
"Emacs Mac Port" and can be installed through a "tap" like so:

``` sh
$ brew tap railwaycat/emacsmacport
$ brew install emacs-mac
```

Finally, there is a package called [Aquamacs](http://aquamacs.org/), which
claims to bring more of the Aqua-style chrome to Emacs. In spite of being a
moderate OS X fanboy I find this offensive and haven't tried it myself.

The two OS X builds mentioned above, "GNU Emacs for Mac OS X" and "Emacs Mac
Port," are rather different and each have advantages and disadvantages. Some of
the key code handling is different in each, with the former interpreting the
actual Mac "alt/option" key as "alt" and the latter re-mapping the Mac "command"
key to "alt," which is a bit easier to type ("alt" is used regularly in Emacs),
but you will lose the ability to specifically map "super," which is the name of
the command/Windows key.

Both can do native full-screen, but the former does it a little better. I've
settled on the latter package for now as it seems to handle Unicode properly,
which is kind of a big deal to me. Both will load your configuration seamlessly
so it's easy to just try them both out and see what you like or don't like about
them.

## Learn the Basics ##

There are just a few essential keys you need to know to get started using Emacs
in its bare form. Most of the default key mappings in Emacs are a sequence of
control key presses, so, for example, `C-x C-c` means to press "control" and
"x", then press "control" and "c".

In Emacs notation, which I will use here, `RET` means return (or "enter"), and
`M` means "meta" or "alt". Depending on the build of Emacs you are using and
what your keyboard layout is, the physical key may vary; try each potential key
until you get the right result.

* `C-x C-c`: quit Emacs. As all new Vim users must first learn `:q<CR>`, so must
  new Emacs users learn this bizarre chord.
* `C-g`: cancel. This is the one piece of muscle memory you really need to
  acquire; even once you have re-mapped `escape` to quit from 90% of
  circumstances, there will remain some where only `C-g` will get you out. Just
  learn it, use it, it's not so bad.
* `M-x`: execute extended command. This is the gateway to a lot of the
  sophisticated stuff you can accomplish interactively in Emacs; it allows you
  to run any Elisp function by name. More on this later.
* `C-h ?`: help about help. This chord opens a list of potential help topics,
  each of which has its own direct mapping accessible through e.g. `C-h t`,
  which opens the Emacs tutorial.

Those are the only native mappings you really need to know to get started. If
you press some chord and something crazy happens, you can try backing out of it
with `C-g`, and to learn what the chord does you can ask Emacs for help about
the key by pressing `C-h k` and then pressing the key or chord in question.

This is one of the nicest things about Emacs; it's self-documenting. If you want
to know what `C-x C-c` does, you can simply press `C-h k C-x C-c`. I know, that
doesn't seem so simple, but you do get used to these chords, and since you won't
use them for all normal text editing, they just sit there in the background
until you do need them.

## Configure Your Environment ##

Configuring Emacs is easily as involved as configuring Vim, if not more
so. Unlike Vim, however, Emacs ships with an interactive configuration tool that
you can use as a beginner to configure basic settings without having to plumb
the depths of Emacs numerous variables and functions. We'll get to that later.

Step one is to make yourself a home for your config, if your package of choice
didn't create one for you:

* Create the directory `~/.emacs.d`
* Create the file `~/.emacs`

Open `~/.emacs` in your favorite editor and paste in this nonsense, which,
sooner or later, will actually make sense to you:

``` cl
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
 
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
 
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
 
(setq package-enable-at-startup nil)
(package-initialize)
 
(require-package 'fullframe)
(fullframe list-packages quit-window)
```

The above code adds the common Emacs package repositories to the list of
available repositories so that we can install the latest and greatest versions
of modern Emacs packages, which are analogous to Vim plug-ins.

Start Emacs. You should now be able to press `M-x` to get a prompt at the bottom
of the window and type the command `package-list-packages RET`. Tab completion
works in that prompt, so feel free to use it to confirm that Emacs can find the
function. Emacs will connect to the Internet to download package lists and open
a window listing the packages available.

This part gets sticky because you need to use default Emacs key mappings to
navigate the package list, so let's just quit the buffer now that we have the
package lists updated. Press `q`.

## Install Evil Mode ##

Finally, install `evil-mode`, the Vim emulation package for Emacs, by typing
`M-x package-install RET evil-mode RET`. A second window should open and a lot
of stuff should happen in it as the package is downloaded and compiled (Emacs
Lisp uses an opcode compiler to speed its runtime). When it's through,
`evil-mode` should be installed. Let's turn it on.

Type `M-x evil-mode RET`. You should now be able to type `:q` to quit Emacs.
