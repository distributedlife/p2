---
layout: post
title: Debugging is bad for you
permalink: /issue07/debugging-is-bad-for-you
subtitle: 
byline: Ryan Boucher
category: issue07
authors:
    - name: Ryan Boucher
      twitter: distributedlife
      avatar: ryan-avatar.jpg
---
I'm mildly bothered by announcements like "we've made it easier to attach a debugger". Why? To me, using the debugger is an admission that you don't understand the code. Consider all the times you used the debugger. Was your code working as you expected? Methinks not.

I used to live in the debugger. It was a homely place and I, a studious pupil of F5 Driven Development (also known as Debug Driven Development). I was in the process of tidying up my blog and I found this article where I talked about how the combination of the comma-operator and default parameters conspired to undo me.

Take a look at this code:

<div class='normal-gist'><code id="gist-7716891" data-file="code.cc"></code></div>

The first calls isMatch that has a default parameter to false (don't update the catalogue) and that boolean you see there, we'll that's a part of the if-statement and not the isMatch call. That's because C++ has: operator,(). This is the comma-operator that evaluates each expression but only returns the right hand most value. From memory, the if-statement is always true.

The second block is how the code should have been, but it is very hard to spot the difference. We shouldn't have written it this way for that very reason; its crappy code. There is all sorts of badness going on: the Law of Demeter, default parameters in interfaces, the command-query principle and a very poorly named function. Also, from the looks of this code I had a collection with a catalogue inside of it. What!?

I used the debugger to get me out of this mess. I should have just written a test and established some expectations. It would not have been hard, but back when I wrote this I didn't really know how to do unit testing.

I don't do this any more: write in C++ or use the debugger, unless I have to. So, what do I do when I encounter code that doesn't work as expected? I follow these steps:

1. I make a mental note that this code is too complicated and I'll need to refactor it. If I can't make head nor tail of it, and I'm writing it, what hope is there for whoever follows me? 

2. I have tests these days. So I'll ask myself: are these tests trying to do too much? Could I write a more discrete test for this? 

3. I make sure that I've stubbed all my dependencies correctly. Do I have too many dependencies? Could I reduce my overall dependency count by combining some of them?

4. I try and write simpler expectations. Do we even have a result? Is it JSON? Does it have the element we care about? Does it have our expected value? It's usually a case that I've missed some simpler tests, that would have failed had I had them.

5. If I've done all this then it's time to break out the debugger. Find out what is going on. Then go back and write some tests for what I just learned. Using the debugger is like a technical spike. You get in, you learn and then you get out. Once you're out you do things properly.

-> ⁂ <-

There was a time once when I would step over each line of my code in the debugger to make sure it was doing what I expected it to do. This was before I released it. It was like the paper desk check. 

What a waste of time.