---
layout: post
title: BDD and Legacy Systems
subtitle: Behaviour driven development, by itself, doesn’t work on legacy systems. A key ingredient is still missing and I’m going to talk about what that is.
permalink: /issue05/bdd-on-legacy/
byline: Ryan Boucher
category: issue05
authors:
    - name: Ryan Boucher
      twitter: distributedlife
      avatar: ryan-avatar.jpg
---
I often see or hear the complaint that behaviour driven development (BDD) results in tests that are slow, brittle or both. This is especially the case if the testing tool uses a Gherkin based syntax.

One of the benefits I get out of BDD is that it helps me flush out the domain model. Things get named and I ask questions about those named things. I question, uncover and learn. One of the challenges of BDD is when you already have a domain model coded into place, which is the case when you are dealing with legacy systems. Let’s ignore the fact that we’re in a situation where we are trying to use something called *behaviour driven development* and the code is already written and unlikely to have any tests at all.

> Developers, who don’t have remit to refactor, are no different to testers.

What I’m talking about here is legacy systems. The system has been built; classes relate and collaborate. When the language of the tests you write are worded using a new domain model you end up having to implement the test using the existing implementation. This a non-trivial process and is where the slowness and brittleness can come in. 

Imagine we’re working on a project and we have improved our understanding of the domain model. We could resolve these slowness and brittleness issues if we refactored our implementation to better map our better understood domain model. This isn’t an easy task. If you’re applying BDD after the fact it is usually because you’ve got no other tests anywhere else in the code base. 

We know that refactoring is important and will help us, but **who** is writing these tests greatly influences whether or not the domain model will ever get refactored. Testers can be strong advocates of tools like Cucumber and strive to include them. But testers are rarely in a position to refactor the code. So tests written by testers will struggle to be fast and robust.

Developers, who don’t have remit to refactor, are no different to testers. They can write tests and these will support the new features they have deliver. Their tests though will also struggle to be fast and robust for the same reasons.

The takeaway is: the next time you decide to bring a BDD tool into your project make sure you can refactor your domain model. If you don’t you’ll just end up blaming the tool for being not very good at something it has no control over.