---
layout: post
title: Going Native With RubyMotion
permalink: /issue06/rubymotion
byline: Sean Ho and Rachel Laycock
category: issue06
authors:
    - name: Sean Ho
      twitter: 
      avatar: sean-ho-avatar.jpg
    - name: Rachel Laycock
      twitter: rachellaycock
      avatar: rachel-avatar.jpg
---
It is common knowledge in development circles that there is a steep learning curve for iOS Native application development with Objective-C. Even when you are an expert in other languages the environment of Objective-C development can be difficult and painful. There are options available, which can ease the pain and allow you develop in other languages, like Calatrava for CoffeeScript and Phonegap for Javascript. But with those you often lose a lot of the ability to develop native functionality, which could be the differentiator of your application. I’m here with Sean Ho who made the bold decision to go with RubyMotion, lets find out why.

### Sean, Tell us about your project
Roomz is a Sydney-based startup working to make shared living arrangements safer and easier. The main service is a web application marketplace where you can post your room and search for roommates with similar interests safely. We're also developing a product that provides legal agreements and allows you to automate rent collection. In December of last year, we decided that we needed a more coherent mobile strategy than the ad-hoc approach we'd taken thus far.


### What led you to choose RubyMotion for iOS native app development?
Our initial brainstorming led to three options:

 1. Desktop-only web + HTML5 mobile app + mobile web (same code as HTML5 mobile app)
 1. Desktop-only web + hybrid mobile app + mobile web (share code with hybrid mobile app)
 1. Mobile-friendly web + native mobile app

We value design and interaction details and a unified design would have meant compromises that we were unwilling to take. More importantly, we felt that having an app that felt native was important from a user experience perspective. Apart from that, business needs meant that iOS and at-least-functional-if-not-terribly-pleasant mobile web were the main priorities further pushing us away from cross platform frameworks. We abandoned option 1 and 2 almost immediately after the first meeting.

Because we were developer constrained (we only had three devs), we sought a solution that balanced our learning efforts between building a new iOS app and iterating on our existing Rails application. The team were all accomplished Ruby developers, but only one of us had Objective-C experience. That’s when we looked into RubyMotion, thinking to leverage our Ruby skills to build a native iOS app.

RubyMotion was about half a year old at that time. The community was still relatively small. For cutting edge technology like this, community support was near non-existence. If we hit a major bug in RubyMotion, either we have to wait for a fix or we need to patch it ourselves. Nevertheless, we believed the benefits like leveraging the team’s Ruby skills and productivity gain from the tools could justify the costs. We made the bold decision to use RubyMotion.


### What did you like about using RubyMotion?
We spent about 2 months fiddling with the design, like changing from list layout to multi-column card layout or switching from master-detail to stacked layer navigation. We didn't just sketch them out on Photoshop, we actually built and played with all the different designs. From a technical perspective, that would mean a lot of refactoring and restructuring of code. Thanks to the dynamic nature of Ruby, swapping out a library with another could sometimes require no code change at all. Unlike Objective-C, you have to update class references everywhere in the interface and implementation files.

RubyMotion is 100% compatible with Cocoapods (an Objective-C dependency management tool), which means we can use any existing Objective-C libraries in our RubyMotion project. A huge win for us as we could immediately start using the high quality Objective-C libraries without needing to wait or make RubyMotion specific ports.


### What were challenges of using RubyMotion?
One might think RubyMotion is plain Ruby, except that it is not. The named parameters inherited from Objective-C did hit a nerve with some developers in Ruby community initially. Though, it is not so much a problem after Ruby 2.0 released with named parameters support. The original weird syntax in RubyMotion became a standard in Ruby 2.0. A lot of people are still feeling uneasy with the mix of camel and snake cases in their code.

People often asked if they can use existing Ruby gems for RubyMotion, short answer is no. RubyMotion doesn't support all dynamic features in Ruby (like eval), it is possible only if the gem is compatible with RubyMotion compiler.

Literally every new version breaks things! A common problem for all bleeding edge technologies. Every time we upgrade either RubyMotion, Cocoapods or Gems, we ended up spending hours investigating and fixing the errors. Even worse, if the application crashes and the error occurs in system or 3rd party libraries, RubyMotion can only give a vague hint of the cause of the error. No line number, no stack trace. Either you are very good at guessing or you have to consult Google for the solution.


### What were your experiences with tooling e.g. Build tools, testing tools, CI, deployment etc?
RubyMotion development tools are Rake-based, which means everything can be done with command line (building for different environments, running specs, deploying to TestFlight etc.). Not only that, but it makes Continuous Integration a lot easier than native Objective C. We also get to choose our favorite editor or IDE without the need to mess with the notorious Xcode.

RubyMotion comes with its own testing suite, an RSpec clone named MacBacon. People with Objective-C background find it reads better than any Objective-C testing suites. But for Ruby developers, it is not quite what they expect. It has no built-in stubbing/mocking support, lacks helpers and hooks, and provides only basic grouping. There are 3rd party libraries to tackle some of these problems, but it still doesn’t work exactly like RSpec.


### Why is this a better choice than Objective-C, Calatrava and PhoneGap etc?
Whether Ruby is a better language choice than Objective-C is up for debate, but Ruby does offer cleaner syntax than Objective-C, especially when everyone uses blocks these days, writing blocks in Ruby is so much more enjoyable. Check this out if you don't know what Objective-C blocks looks like: fuckingblocksyntax.com

HTML5-based frameworks like Calatrava and PhoneGap impose some restrictions on the flow and design of the app, which means they are not great for building tailor-made design and interaction. We believed going native is the right thing to do, and a month later after we made our decision, Facebook announced ditching HTML5 for native code, followed by LinkedIn and 37signals released Basecamp using RubyMotion and claimed a success.

RubyMotion might not be a technology for everyone, but it does work well for Roomz and provided us the pace we need as a startup.