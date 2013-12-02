---
layout: post
title: Trust and Truth in Design
subtitle: 
permalink: /issue07/trust-and-truth
byline: Craig Wattrus
category: issue07
authors:
    - name: Craig Wattrus
      twitter: cwattrus
      avatar: craig-avatar.jpg
---
Taking a moment out of my project, I reflected and realized just how serious it would be if something went wrong. In this project, a system was being created to build trust in consumers, who are at risk of purchasing counterfeit medicine, and the retailers selling this medicine.

At the same time, a concept I've been loosely calling "Single Point of Truth" came back to me. Perhaps I had it wrong. It's not necessarily about singularity, but rather about trust.

Trust comes in many forms with one common thread. Breaking trust is a swift matter - however repairing it is very difficult, and sometimes impossible. In my world as an experience designer, trust was something I took for granted with the users of the applications that I design for.

If even for a second the system mentioned above provides a non-truthful answer, the consumer could purchase expired or harmful medicine, take that medicine, and face catastrophic consequences. This sounds scary. Because it is.

I am going to call these important touch points and this sometimes critical information "points of truth".

Bringing it back to a less scary context, I'd like to share some of my thoughts, experiences and tools. My hope is to assist people who are building experiences to instill the right amount of trust using points of truth as a guideline.

I am going to use my situation as a starting point. This assumes that I know what information I want to convey to the user. I also know what information I can guarantee, and to what degree.

### What are the expectations?

Finding out what users expect from the application is the first mystery. This can become complex, because we cannot design for each person's personal needs, but rather for implicit and/or explicit expectations set by us. This makes pointing out where truth is - and isn't - all the more important.

Think about an alarm clock set to the right time. It is an implicit expectation that when I set the alarm time, the alarm will go off at that time - no earlier, and no later. If the alarm doesn't go off I am late for work, or miss something important. The way I see it is this: I trusted the alarm clock, it broke my trust by not maintaining the truth. I therefore no longer trust that clock, and will have to use another.

Set the expectations, set them again, and then hope for the best.

### Misunderstanding breaks trust

Although this does sound like a Dr. Phil statement, it could be the make, or break, for a point of truth.

The first example that comes to mind brings me back to the reason for this article. In this system that I am working on, if a user sends in a code hidden under a scratch-to-reveal surface, he or she would ideally receive a "positive" response. Sending in that code again warns the user that the code is already used and the medicine could very well be compromised.

Let's imagine a user named Sheila, who understands the system and so purchases medicine for her cousin, scratches off the code and is satisfied with a positive response. She then hands over the medicine to her cousin. The cousin receives the medicine, is not aware of the single use nature of the hidden code and sends it in again. This time we also set off a suspected breach notification since two different numbers in potentially geographically dispersed locations have tried to verify medicine with the same code. The cousin would receive a negative response and immediately panic, ditch the medicine, and possibly even publicly talk down the retailer who supplied the perfectly good product.

Getting to a shared understanding is crucial if I am to be successful in conveying information accurately and building/maintaining much needed trust with users.

Now that I have a decent setup for my point of truth, all that remains is building it into the design. Experience designers need to build in pertinent design cues. Pertinence in this case is based on expectations, understanding, and the designer's confidence in the guarantee of truthfulness of the information.

Some techniques for designing with points of truth

The key here is being honest and providing the right information and context at the right time.

 - **Context** - provide a quick way for your user to find out more about the information. In the case of the fake medicine, there should be a "Phone this free number ### to talk to a human" on the negative response SMS.
 - **Set Expectations** - this is relatively easy as you can use words to explicitly set expectations with the user. E.g. "We will attempt to update your location every 5 seconds", sounds a lot less confident than, "Your location is updated every 5 seconds."
 - **Color** - Use color to indicate the severity of information. Adding a little color can help grab your users attention. When editing a document. I might see a block that is green and says "Saved", when that block turns red I can safely assume without even reading it that my document is no longer saved at it’s current point. Colors are a universal language.
 - **Estimation** - Provide closest value indications. E.g. Your location on this map is accurate to within 5 meters.
 - **Timing** - Give the user a schedule and be honest about "real-time" E.g. Your location is updated every 5 seconds, the last update was 6 seconds ago. 
 - **Honesty** - Don’t over promise and under deliver. Try to strike a good balance between what normally happens and the worst case.

Be Proactive - Let users know about problems before they find out. It is possible to detect a dropped internet connection. Alert the user about this and make sure any affected points of truth are adjusted to a offline "mode". E.g. The last location we could find you at was 15mins ago, please reconnect to the internet so that we can find your latest location.

Good old user-centric design is a key ally here. It leads to a more thorough understanding of the user giving the designer a good idea of the expectations, fears and challenges facing the user. 

After the design is in a testable format, its failures could be found with good user testing and research.

### Now back to that "Single point of truth"

I now see the singularity of truth from a different angle than before. It is, in fact, potentially a very powerful tool.

Using the single point of truth creates a more intimate bond of trust. Having only one place that I can be assured of accurate information, means that it is very possible that the user has no other way to verify the information. This sets a higher bar for that point and the designer should tread with caution. This is what I'd call the point of criticality for the designer. This point should only be used when there is only one possible version of the truth and you are extremely certain that you can deliver on that truth, every time.


