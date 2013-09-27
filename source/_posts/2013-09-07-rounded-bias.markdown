---
layout: post
title: A well rounded bias
permalink: /issue04/rounded-bias/
byline: Ryan Boucher
category: issue04
authors:
    - name: Ryan Boucher
      twitter: distributedlife
      avatar: ryan-avatar.jpg
---
I was on a project with another ThoughtWorker called Neil Craven. We stood next to a computer with a few other people on the team. Neil was the analyst: the one setting the scene for this new story. He mentioned that we needed to round a number to two decimal places. I was being a smart-arse and asked how he would like that rounded -as if there was more than one way to round a number. Neil responded with “*Round half to even*, of course”.

> "I was being a smart-arse"

I was dumbfounded. I had never heard of this before and we fell into a Wikipedia hole. When we resurfaced we now knew that there are different strategies for tie-breaking. A tie-break strategy is required when you end up with 0.5 as the final digit because the number is split exactly between the two numbers we could round to. Round Half to Even is one strategy and the is IEEE standard for rounding. The idea is to round the number to the nearest even number.

**22.5 rounds down to 22**

**23.5 rounds up to 24**

Neil had grown up in Scotland where he learned it at school. I had grown up in Australia and had learnt *Round Half Up*. 

**22.5 rounds up to 23**

**23.5 rounds up to 24**

The reason that multiple rounding strategies exist is to deal with bias. *Round Half Up* has a positive bias. This bias become a problem when do statistical analysis on large datasets. If you always rounded up, then the average would be higher than it should be. If you were making important decisions based on these numbers then there could be a problem. *Round Half to Even* tries to avoid this positive bias. It succeeds but at the cost of introducing a different bias: a bias towards even numbers. 

We could *Round Half Down*, and take a negative bias and *Round Half to Odd* to introduce –my favourite bias: an odd bias. There are other strategies such as *Stochastic Rounding* and *Alternate Tie-Breaking* that just about succeed in removing bias. *Stochastic Rounding*, however is non-deterministic and *Alternate Tie-Breaking* will, on odd-frequencies have a tiny positive or negative bias. As you will see, removing all bias wasn't our goal.

The question that needs answering is what do we need to care about? In our case, we were rounding a number that was not related to money. So *Round Half to Even* was **good enough**. Had it been related to money, then within Australia the Taxation Department requires that for all tie-breaks we *Round Half Up*.

As exciting as rounding numbers and tie-breaking is. This story should remind us of the assumptions that we carry with us without knowing it. Our own personal biases. There are strategies for dealing with bias in rounding errors, do you have a strategy for dealing with the biases in your thinking?