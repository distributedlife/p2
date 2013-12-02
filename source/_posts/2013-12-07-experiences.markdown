---
layout: post
title: Experiences Changing Programming Languages
permalink: /issue07/experiences
byline: Kornelis Sietsma
category: issue07
authors:
    - name: Kornelis Sietsma
      twitter: kornys
      avatar: korny-avatar.png
---
In this series we ask ThoughtWorkers to talk about a challenging time for them. A time when learning a new programming language challenged and then changed the way they thought. 

This month, Korny tells us his story.

When I started using Clojure, it was a bit like a trip back in time.  I learned to program in C. There you would put data into a struct, then use the right functions to manipulate it.  This was of course risky and dangerous - structs were mutable, functions were ugly, and dispatching the right function to the right struct was complex and dangerous. Especially with no concept of unit testing.  Then came OO, and C++. You could safely hide that struct from modification by putting it in an object, wrapping all mutation in methods, and dispatching to the right implementation through polymorphism.  Problem solved.

Now we are in the future - we should have jet-packs and flying cars, but instead, along comes a language where you typically put data into maps (which look suspiciously like structs), and manipulate them with functions.  However, this time it's different: cunning data structures make the maps immutable **and** efficient; multimethods and higher-order functions mean you can dispatch the right functions to the right data however you like - and with protocols, you can even get a bit newfangled and dispatch that data based on it's type.

Clojure really helped me revisit some of my assumptions.  Nowadays in Ruby or JavaScript, or even in Java, instead of instinctively saying "how do I wrap that in an object?" I'll consider whether OO is actually appropriate, or whether I can keep things simpler with data structures and a dash of FP.  And I'll try to stamp out mutable state wherever it might lurk.
