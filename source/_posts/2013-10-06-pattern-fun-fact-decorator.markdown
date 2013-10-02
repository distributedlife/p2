---
layout: post
title: "Pattern Fun Facts: Decorator"
subtitle: "In pattern fun facts we take a look a pattern and tell you something you didn’t know. This month: The decorator pattern can help you do incremental delivery."
permalink: /issue05/pattern-fun-fact-decorator
byline: Ryan Boucher
category: issue05
authors:
    - name: Ryan Boucher
      twitter: distributedlife
      avatar: ryan-avatar.jpg
---
The decorator pattern is a nifty way of adding behaviour to existing objects. Let’s say you have a class that is responsible for sending messages over the network.

<div class='normal-gist'><code id="gist-6724242" data-file="1.java"></code></div>

Later, there comes a requirement where you want start making a copy of messages going over the network but you don’t want to change any existing behaviour. So you write a decorator to do the work.

<div class='normal-gist'><code id="gist-6724242" data-file="2.java"></code></div>

Now, because we’re in Java and the factory pattern is prolific. Your factory just needs to new up a <span class='inline-code'>MessageCopier</span> passing in the instance of the <span class='inline-code'>MessageSender</span>. Behaviour extended.

<div class='normal-gist'><code id="gist-6724242" data-file="3.java"></code></div>

One thing you may note is that the implementation of <span class='inline-code'>MessageCopier</span> is quite thin. It only has a new bit of behaviour in it. Everything that isn’t relevant is elsewhere; a separation of concerns. As the consumers of the <span class='inline-code'>MessageSender</span> interface get their implementations from a factory you can now add in new behaviour incrementally with minimal rework. As the behaviour is constrained you can test behaviour in isolation, more easily.

*That was this month’s pattern fun fact. Do you have a pattern fun fact you would like to share? Send it to us at p2@thoughtworks.com and we’ll publish it.*