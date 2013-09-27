---
layout: post
title: I can tell you, but then you'd understand.
permalink: /issue05/anonymous-functions
subtitle: On anonymous functions, code readability and design erosion.
byline: Ryan Boucher
page: 1
pagetotal: 9
issue: Issue 05, September 2013
issuelink: /p2/issue05/index/
prev: /p2/issue05/index/
nxt: /p2/issue05/cooking-with-clojure
authors:
    - name: Ryan Boucher
      twitter: distributedlife
      avatar: ryan-avatar.jpg
---
Let me start with this statement: *the use of anonymous functions make your code harder to read and, can erode your design*. An anonymous function is a function that's never bound to an identifier. I prefer to define it as '*a function that has no name*' as Javascript can have anonymous functions that can still have a '*name*':

<div class='normal-gist'><code id="gist-6723883" data-file="1.js"></code></div>

The above function is anonymous, but has a name <span class='inline-code'>my_awesome_function</span> and that name can be changed through assignment. 

<div class='normal-gist'><code id="gist-6723883" data-file="2.js"></code></div>

The important thing here, is whether the function has an identifiable name when **I’m** reading the code. Anonymous functions have no name during debug. Here is an example of some code that has four anonymous functions, but we’re going to focus on the outermost function, I’d tell you what it’s called but… you know.  You may remember this code from the [Issue 02’s Improve This](/p2/issue02/improve-this).

<div class='normal-gist'><code id="gist-6723883" data-file="3.js"></code></div>

The issue I have here is that it’s not obvious what this code does. I **can** work it out but I’d rather not **have** to. So my question is, could we have named it? This would be a challenge because this function is doing streaming, validation and persistence. Trying to name something that does more than one thing is hard. Naming functions is already hard without this added complexity. 

A well named function should do what it says. An anonymous function makes no such promise. When new behaviour comes it can be easily slipped into an anonymous function and everything still 'makes sense'. I prefer to see it as: *anonymous functions make it easier to avoid the pain of naming a function*. "I can just use an anonymous function here". The pain gets **deferred** to the person who later has to read and understand the function.

In the Improve This article, the function ended up being split into two parts. The first part performs steaming and validation. It also accepts a callback which it invokes on valid entries. 

<div class='normal-gist'><code id="gist-6723883" data-file="4.js"></code></div>

The first function is now better named and the callback, with different concerns, is now named and self-contained.

Now, not all anonymous functions are bad. An example of when having a named function doesn’t add much is when you’re passing a predicate to a well named function or you want to make good use of your closure.

<div class='normal-gist'><code id="gist-6723883" data-file="5.js"></code></div>

But even then, I still find better ways to express the same thing.

<div class='normal-gist'><code id="gist-6723883" data-file="6.js"></code></div>

The next time you’re writing an anonymous function consider if it needs a name. Or, if you are extending an existing function, consider if it still does what it says on the tin. Sometimes you might find that what you are trying to do, already exists, with a good name:

<div class='normal-gist'><code id="gist-6723883" data-file="7.js"></code></div>

Is also:

<div class='normal-gist'><code id="gist-6723883" data-file="8.js"></code></div>