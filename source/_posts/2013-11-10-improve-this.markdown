---
layout: post
title: Improve This
permalink: /issue06/improve-this/
byline: Musa Kurhula Baloyi
category: issue06
authors:
    - name: Musa Kurhula Baloyi
      avatar: musa-avatar.jpg
---
*In improve this we take a look at a reader submitted test, user interface, story or block of code and we try and improve it, without context, explaining what we did as we went.*

This month's Improve This comes from Musa. Musa started with some code that he wrote before joining ThoughtWorks. He wanted to look back at what he'd learnt and see how the code he used to write has changed.

The code below populates sets up the initial board state for the game of Ncuva.

<div class='normal-gist'><code id="gist-7301907" data-file="1.py"></code></div>

The for loop makes use of 3 global variables: the length, width and number of stones in each slot. The length and width control how much looping is done. The two cases for the number of stones catered for here are 2 and 3. 

Executing this code will give rise to a structure like this:

![Ncuva Board Layout](/p2/images/improve-this/ncuva.png)

As you can see from the figure displayed above, there is a pattern at work here. The pattern screams out: there are two many 2's! We gather that we do not have to loop through all of a to know how many stones to place in each slot.

On having noticed the pattern, we go ahead and fill a with 2 or 3 stones according to the user's choice. How many corrections would we have to do if we filled a with 2's? Would this approach provide any savings? 6 (at best 4) corrections are better than 4x10x5 (at worst 4x10x7) checks. 

For the time being we leave out all the if statements.

<div class='normal-gist'><code id="gist-7301907" data-file="3.py"></code></div>

Instead of going another iteration around the board, we just pick the specific indices that have been assigned wrongly and give them correct values.

In fact, this for-loop can be optimised out by using the built-in map function. 


According to ncuva rules, at the beginning of each game, the first and second slots in the second and third rows will always have no stone and 1 stone, respectively. If you look at the figure, you should notice that these slots are mirror images of each other. So we go ahead and assign these slots accordingly.

<div class='normal-gist'><code id="gist-7301907" data-file="4.py"></code></div>

Since Python has the ability to count from the end of a list going backwards, we can replace the calculation width - some_number with the negative of some_number. In fact, we do not need the if as a will not be changed incorrectly for stones = 2 or stones = 3. 

<div class='normal-gist'><code id="gist-7301907" data-file="5.py"></code></div>

We now introduce a method so that a can be populated whenever needed and not just once when the game starts. set_board_up takes length, width and stones as input. This means we can get rid of these three lines:

<div class='normal-gist'><code id="gist-7301907" data-file="6.py"></code></div>

Comments and global variables are a sign of bad design.

We have given the method a meaningful name and so now we rename the variable a to board. We could probably guess that a is an array but we would never know where, when or how it is used. At the very least, the name board gives a hint.

<div class='normal-gist'><code id="gist-7301907" data-file="7.py"></code></div>

In the method, we make other small naming changes. We change width to breadth to adhere to naming conventions when working with rectangles. In the same vein, ncuva players don't only use stones as their tokens, they can use makanyi (morula fruit) or timongo (dry morula fruit), so we use the more generic term: tincuva.

Another small refactoring we can do to make the method shorter is make use of destructuring assignment to make multiple variable assignments on the same line. I made the judgment call of multiply assigning slots with the same value for readability. I could have done it on a per row basis.

<div class='normal-gist'><code id="gist-7301907" data-file="8.py"></code></div>

The question is: why didn't I come straight to this last result? The answer is simple: when you don't know where you're going, it's hard to get there. Rewriting and testing the code with python helped me understand the code and intended result better. The thing with refactoring and clean code is that it is obvious afterwards, but not when you first write the code.