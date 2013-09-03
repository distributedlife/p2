---
layout: post
title: Improve This
permalink: /issue04/improve-this/
byline: The P2 Elves
page: 7
pagetotal: 9
issue: Issue 04, September 2013
issuelink: /p2/issue04/index/
prev: /p2/issue04/rounded-bias/
nxt: /p2/issue04/puzzle/
authors:
    - name: by The P2 Elves
      avatar: pdp11-avatar.jpg
---
*In improve this we take a look at a reader submitted test, user interface, story or block of code and we try and improve it, without context, explaining what we did as we went.*

In this issue we have with two tiny partials of code. It’s some ASPX/HTML madness 

<div class='normal-gist'><script src='https://gist.github.com/distributedlife/6411769.js'></script></div>

The first thing we should do is try and remove the conditional logic and the editable properties out. This behaviour should be in the controller. The controller logic should be ‘If the user has insufficient privileges to edit but can see the record’, redirect the user to the view-only resource. 

<div class='normal-gist'><script src="https://gist.github.com/distributedlife/6411783.js"></script></div>

The goal of the conditional <span class='inline-code'>(isCurrentUser || isAdminUser)</span> is to not show the personal email address unless a user is looking at their own account or an admin is looking. There are couple of ways we can handle this.

### Keep the view logic.
If you want to keep the view logic, then the next step would be to collapse the conditional down to one branch.

<div class='normal-gist'><script src="https://gist.github.com/distributedlife/6411798.js"></script></div>

The personalEmailIsVisible property is set on the controller. 

<div class='normal-gist'><script src="https://gist.github.com/distributedlife/6411809.js"></script></div>

With fewer code paths our testing becomes simpler. 

### Remove the view logic and mask the property
Here change the view to always render the personal email address:

<div class='normal-gist'><script src="https://gist.github.com/distributedlife/6411817.js"></script></div>

What we do in the controller is mask the value for users who should not see that data.

<div class='normal-gist'><script src="https://gist.github.com/distributedlife/6411821.js"></script></div>

### Remove the view logic and make a new domain object
I would trend towards making new domain objects as the view fractures with conditionals. Let’s call it a <span class='inline-code'>PublicPerson</span>. There is no personal email address on this model so the conditional logic is no longer required. I would use an adapter to turn the <span class='inline-code'>PrivatePerson</span> object into a <span class='inline-code'>PublicPerson</span>. The challenge with object oriented programming is more logic you have, the muddier your domain model becomes.

Here is our view and controller

<div class='normal-gist'><script src="https://gist.github.com/distributedlife/6411828.js"></script></div>


### Minor Model Changes and some CSS
I would rename the model from Model to something that was more meaningful like <span class='inline-code'>Person</span>. This changes <span class='inline-code'>Model.StreetAddress</span> to <span class='inline-code'>Person.HomeAddress</span>. It’s a bit mixed in places as there is <span class='inline-code'>HomeAddress.StreetAddress</span>, <span class='inline-code'>StreetAddress</span>, <span class='inline-code'>Model.StreetAddress</span>. As there is only one line for the street and there appears to be only one address (home) all this relates to a person. so <span class='inline-code'>Person.HomeAddress</span> is a good name.

I’d also make the <span class='inline-code'>AlternateEmail</span> and <span class='inline-code'>PersonalEmail</span> consistent. It should be one or the other, using both terms makes it feel like the domain model is not fully understood. I’d also remove the cols and rows properties and move them into CSS as height and width. The span elements in the second paragraph are probably there for formatting. Remove them and style them using CSS. 

<div class='normal-gist'><script src="https://gist.github.com/distributedlife/6411842.js"></script></div>

### The Sucker Punch
The final improvement is easy to miss and by the longest margin: the most important. It’s the reason why this code snippet was put up for review. Neither the address or the email address have had the values encoded. This meant that arbitrary javascript was inserted into the fields and executed as the page is rendered. The fix is quite simple.

<div class='normal-gist'><script src="https://gist.github.com/distributedlife/6411852.js"></script></div>

*Do you have something you want improved? Send it to p2@thoughtworks.com.*

&nbsp;