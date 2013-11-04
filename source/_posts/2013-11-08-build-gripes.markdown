---
layout: post
title: Build Gripes, Part II
subtitle: 
permalink: /issue06/build-gripes
byline: Scott Robinson
category: issue06
authors:
    - name: Scott Robinson
      avatar: scott-avatar.jpg
---
***build system (noun)***: *something hundreds of thousands of people spend 40 hours a week in fear of causing. See also: sin, punishment.*

### Problem: "I checked in all our dependencies! Now our build is self-contained!"
Checking in dependencies is borrowing from Peter to pay Paul. Or, to borrow an old joke: some people, when faced with having to continually pull from a dependency, think "I know, I'll just fork and maintain my own dependencies!" Now they have two problems.

Do not check-in dependencies. The problem of dependencies is not one of *version control* (tracking changes) but of *artifact control* (ensuring uniformity). 

#### Current Solutions:
**A download script.**

Go read [Build Gripes, Part I](/p2/issue04/build-gripes). Recall and recoil at the terror of the bootstrap.sh / go.sh.


**An artifact cache.**

Things like maven, bundler, apt-get and friends all have well known and well maintained transparent local caches.

Please note well each word: "transparent", "local", and "cache".

*Transparent*: because the dependency resolution tool thinks it is pulling from the canonical source. Therefore the cache fails-safe with dependency resolution still being possible without it.

*Local*: so we control it and it’s fast.

*Cache*: lets us purge the whole thing and the only downside will be slower builds.

Two scheduled jobs are handy:

 1. Pulling new versions of dependencies.
 1. Detecting stale versions of stored dependencies.


### Problem: "How do I know which dependencies works?"
A security update for FavouriteFramework just came out. And one for FavouriteOperatingSystem. Oh snap, and another (except this one was bundled into a minor release) one for MinorXMLParsingDSLLibraryThing came out. And they all came out on the same day.

So, who wants to call: <span class='inline-code'>make update-dependencies</span> and push the new build?

Oh, of course I will. I trust upstream to not have broken anything. In fact, I’ll just do this for any old version that comes down from above. Wait, no, I mean I’ll only do it for LTS/ESR/major releases. Yes, that’s what I’ll do. I’ll pay IBM, err, Microsoft, err, Red Hat to take the blame for any broken dependencies.

And working through three years of upstream changes is a problem for Future Scott.

sigh. :-(

This applies any time we have third-party dependencies— security or features or whatever. Flickering builds and mysterious reds because of badly pinned dependencies are so obnoxious. They can paralyze a team for a day sending people looking down the avenues of what **their** code changed.

This is the equivalent of a merge conflict. If it hasn't become obvious yet, I view dependencies and merges as the same thing. I view updating to the new version of a framework as "merge hell."

#### Current Solutions:
**Canary builds**

A daily build (I prefer lunchtime because of food coma) that pulls down the latest dependencies and runs a test suite. The build will go red when the dependencies break the build. Now we have whatever small changes occurred in the last day to fix instead of major changes across the last month (libraries) / year (frameworks) / half-decade (operating systems).


**Unpin dependencies entirely and *always* pull the latest versions.**

Schedule the main build to run hourly. Treat reds as if **our** code was broken.

This flips the idea of inward dependencies and outward integrations, and instead views everything as an integration point. It's always the team's job to integrate with the outside world.


### Problem: "QA has been down all day? Why didn't you mention it earlier? Yes, you can interrupt the devs!"
A build isn't successful without an artifact. A test suite isn't successful without a report. A deployment isn't successful without a running service.

"Build-Test-Deploy" is an anti-pattern. It’s "Build-Test. Deploy-Test."

I get angry about this, because **every** project I've been on has fallen into this trap. Why? This is the team variation of Works On My Machine.

#### Current Solutions:
**"curl http://example.com/"**

It's that easy and will get us 80% of the way there.


**Tag artifacts with their source commit**

Verify the artifact contains the correct source commit. A deployment, to me, is just another build artifact. In short: <span class='inline-code'>assert `curl http://example.com/version.txt` == ${commitSHA}</span> # or go home


### Summary
A cyclist quickly learns to consider every other vehicle on the road to be driven by a homicidal maniac who wants to kill them. As do release engineers feel about, well, everyone else in the bit arranging business.

Getting, merging, and validating upstream artifacts is a job for robots. Releasing working artifacts is our job.

Continuous integration and continuous delivery uber alles.