---
layout: post
title: Testing makes it hard to test
subtitle: The level of testing you decide on re-enforces that level of testing and makes it harder to test the system at both lower and higher levels.
permalink: /issue04/testing-hard/
byline: Ryan Boucher
page: 5
pagetotal: 9
issue: Issue 04, September 2013
issuelink: /p2/issue04/index/
prev: /p2/issue04/comic/
nxt: /p2/issue04/rounded-bias/
authors:
    - name: Ryan Boucher
      twitter: distributedlife
      avatar: ryan-avatar.jpg
---
Mike was working on an old, heavily customised, oversized, off-the-shelf content management system. Because it was an off the shelf product, it wasn’t unit-tested. And the organisation didn’t feel they could effectively unit test their modifications to it. So they decided to test higher up the testing pyramid; they chose functional level tests. A couple of consultants were brought in to show the team how. Which they did and as they were very capable developers they wrote lots of tests, fast. Soon they had covered most of the essential flows through the system. Because those consultants had written a lot of tests fast, these tests were reinforced as **the** way to write tests for this system.

> The act of exclusively doing unit testing had made it harder for me to test my system at a higher level.

This had some flow on effects. The first was that new code was not test-driven. All the functional tests were written after the code. When you do that you don’t get the other benefits you get from test-driven code: less code and a well-factored design. The code became complex and making changes began to take longer.

Unit tests execute faster than functional tests. It is true that the existing code was going to be hard to unit test –it had never been designed with testing in mind. The new code wasn’t unit tested because “Why go to the effort of unit testing it, when it’s super easy to write a functional test?”. Their test suite slowed down and their effort switched to making it run faster.

So here we have the well known saga of higher level tests taking a long time to run. When the testing suite takes too long teams waste energy trying to parallelise the build, prune their test suite, or avoiding writing as many tests. A common consultant answer is to write more unit tests. With that comes our second story.

One of my hobbies is the design of games: board, card or computer. I was trying to turn a card game I’d made into a computer game. I was writing it in JavaScript and through the use of RequireJS it was executing entirely on the client. As a tester and strong quality advocate I had unit tested this quite heavily.

But, there came a point where I wanted to run some integration tests to exercise the various options the player could do at different times. I ran into a problem. My game relied on an uncertainty mechanic: a set of shuffled decks. When it came to unit testing it was trivial to test the behaviour but from an integration perspective, I hadn’t left any way for me to create deterministic behaviour. The act of exclusively doing unit testing had made it harder for me to test my system at a higher level.

I’m now a strong proponent of outside-in-testing and why all the layers in the testing pyramid are important. Testing should be done at each level. The deeper down you go the more code design benefits you get, the higher you go the easier it is to test integration behaviour. But it’s not an exclusive thing. A well factored design exists at each layer within the application and across applications. Integration happens as soon as we have two functions interacting. It continues as we zoom out to our unit, then to clusters of units, clusters of clusters –we might call these packages or modules; we keep pulling out to our application, multiple applications interacting with each other and with people and clusters of people interacting with each other.