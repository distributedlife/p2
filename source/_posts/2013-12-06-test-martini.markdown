---
layout: post
title: At your service
subtitle: Saving time automating tests
permalink: /issue07/test-martini
byline: Harinee Muralinath and Sathyan Nair
category: issue07
authors:
    - name: Harinee Muralinath
      twitter: harinee_m
      avatar: harinee-avatar.jpg
    - name: Sathyan Nair
      twitter: GeekCubo
      avatar: sathyan-avatar.jpg
---
UI tests! They suck the life out of me. Maintaining them takes longer than setting up or writing them. It felt like my life was being spent getting tests to go green. It almost drove me insane.

-> ⁂ <-

On my current project, when we came in, they wanted us to improve their automation framework. It’s a familiar story for me. It was a bunch of UI-driven functional tests that were not designed to scale, were difficult to read, a challenge to understand and defied good coding practices.
 
We did the best thing we could: we scrapped the framework. We replaced it with the usual: a UI test framework with Cucumber, Webdriver and Fluentlenium. We reminded ourselves that this was the only test automation that would exist for the 2.5 year old product. There were no unit tests to speak of. So we had to build something that would run quickly and efficiently, and we had to build it now.
 
And we still have to deal with the brittleness of UI tests.
 
What we needed to solve this was a little change in perspective and smaller change in our framework.

Let's look at an example. Say we have a test in the functional suite like this:

Given I have the book "ABC" in my shopping cart
And I am on the checkout page
When I purchase the book
Then I should be shown a confirmation message

Now what are we really testing in here? If we think about it, it is the last two lines.
We should have separate tests elsewhere that add books to cart and navigate to a page. What benefit are we getting by driving all those actions through the UI? What benefit do you get from repeating these actions again and again? 

Let me answer that for you - none! You are retesting what is already tested.
 
You may be thinking at this point. OK, that's interesting. But you can't test the last two lines unless you have performed the pre-requisites?
 
Correct! This is the small framework change. The steps you don't need to validate, you can drive them directly via the APIs. The APIs behind the scenes are less liable to change than the user interface. This means our tests became less brittle. The roundtrip time for an API call will always be faster than the UI too. This reduces the time to run the tests. Most importantly, we are still testing the significant user action from the UI.
 
We cut down our four hour test suite to an hour by implementing this one weird, old tip.