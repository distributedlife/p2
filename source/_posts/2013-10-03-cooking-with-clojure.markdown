---
layout: post
title: Cooking with Clojure
permalink: /issue05/cooking-with-clojure
byline: Chris Ford
page: 2
pagetotal: 9
issue: Issue 05, October 2013
issuelink: /p2/issue05/index/
prev: /p2/issue05/anonymous-functions/
nxt: /p2/issue05/deployment-options/
authors:
    - name: Chris Ford
      twitter: ctford
      avatar: chris-avatar.jpg
---
When I speak to developers about functional programming, they're often interested, but are sometimes concerned that functional programming might make it hard to model the "real world". The theory goes that the everyday world is full of objects that evolve over time, so the most natural way to describe it is using object-oriented design. 

Leaving aside the question of whether or not programmers should be overly concerned about this thing referred to as the "real world", functional programming provides a rich set of concepts that are more than adequate for modelling complex domains. 

As a demonstration of functional design, I'll use Clojure to describe a recipe. Clojure is a variant of Lisp designed to run on the Java Virtual Machine, and it has the key ingredient that makes functional programming possible - functions that can be passed around as values, and that reliably return the same output for the same inputs.

Here are a couple of simple examples of Clojure:

<div class='normal-gist'><code id="gist-6724018" data-file="1.clj"></code></div>

The first example simply binds the name <span class='inline-code'>y</span> to the value <span class='inline-code'>3</span>. The second example is straightforward enough, though it might seem strange that the function <span class='inline-code'>+</span> appears inside the braces and in the first position. That's the way that all Lisps depict function invocation.

The third example has a curious aspect – <span class='inline-code'>+</span> is being passed as an argument to the <span class='inline-code'>reduce</span> function, which uses it to boil down a list of numbers into a single total. Using functions as values that can be passed around isn't possible in many object-oriented programming languages like Java, but it turns out to be very useful. 

Values in Clojure are immutable, meaning that we never destroy old values, we only create new ones representing the new state. Whereas in Java, <span class='inline-code'>y = y + 1</span> means "add one to <span class='inline-code'>y</span>", the equivalent in Clojure is just a comparison:

<div class='normal-gist'><code id="gist-6724018" data-file="2.clj"></code></div>

Of course, simple expressions on their own aren't very useful. Here is how to define a named function in Clojure:

<div class='normal-gist'><code id="gist-6724018" data-file="3.clj"></code></div>

Clojure functions can themselves return functions. Here's a function that makes plus functions. Note that while <span class='inline-code'>defn</span> defines a named function, <span class='inline-code'>fn</span> creates an anonymous function.

<div class='normal-gist'><code id="gist-6724018" data-file="4.clj"></code></div>

Here's another function that works like <span class='inline-code'>plus</span>, but uses Clojure's <span class='inline-code'>fnil</span> function to use  a default value of <span class='inline-code'>0</span> if <span class='inline-code'>nil</span> is supplied:

<div class='normal-gist'><code id="gist-6724018" data-file="5.clj"></code></div>

Each stage in the recipe will be represented as a simple hash map. Some functional programming languages, like [Haskell](http://www.haskell.org/), have very sophisticated type systems that can tell the compiler when functions are invoked on the wrong kind of arguments. Such systems can be tremendously powerful, but they are not strictly necessary for doing functional programming. By using Clojure, we do not have to manage types or type annotations, but we must  accept the burden of ensuring that we invoke our functions in the right way without strong compiler support.

The following represents butterbeans with some water added (measured in grams):

<div class='normal-gist'><code id="gist-6724018" data-file="6.clj"></code></div>

But we're modelling a process, not a fixed state, so we also need a way to depict time and change. The following represents the same ingredients, five minutes into the recipe.

<div class='normal-gist'><code id="gist-6724018" data-file="7.clj"></code></div>

The process of preparing a recipe can then be represented as a series of states:

<div class='normal-gist'><code id="gist-6724018" data-file="8.clj"></code></div>

But how do we get from one state to another? This is where the functions come in. Functions are just a way of representing a mapping from one state to another. Here is a simple function that represents mixing in a certain amount of an ingredient:

<div class='normal-gist'><code id="gist-6724018" data-file="9.clj"></code></div>

There's no need to overwrite the original state of the dish. Instead of having objects with identity that morph and mutate over time, functions take the original state and produce a new state. In the example above, <span class='inline-code'>mix-in</span> takes a dish that has one minute of elapsed time and 150 grams of butterbeans, and produced a new state that had one minute of elapsed time, 150 grams of butterbeans and 300 grams of water. 

Remember, functions are themselves values in a functional programming language, so we can represent the addition of a particular ingredient as a function. Note that <span class='inline-code'>add</span> is a function that takes the ingredient and its quantity as arguments, and returns another function that represents the actual addition. Clojure has no good way to print functions, so it's forced to use a somewhat cryptic identifier when dislaying a function to the screen:

<div class='normal-gist'><code id="gist-6724018" data-file="10.clj"></code></div>

<span class='inline-code'>add-some-water</span> is now a function representing the addition of some water. The function also increments the time taken so far in the recipe. We can use it to transform one state into another:

<div class='normal-gist'><code id="gist-6724018" data-file="11.clj"></code></div>

We can represent any step in our recipe as a function of one state to another. <span class='inline-code'>sit</span> leaves the dish to sit for a certain number of minutes, cooling it if it's warmer than room temperature. For the first time, we'll use Clojure's <span class='inline-code'>(let [...])</span> form, which allows us to create local names:

<div class='normal-gist'><code id="gist-6724018" data-file="12.clj"></code></div>

Sauteing heats up the dish, and evaporates away some of the water:

<div class='normal-gist'><code id="gist-6724018" data-file="13.clj"></code></div>

<span class='inline-code'>add-water-for</span> adds water to the dish based on the weight of a specified ingredient:

<div class='normal-gist'><code id="gist-6724018" data-file="14.clj"></code></div>

<span class='inline-code'>soak</span> transfers mass from <span class='inline-code'>:water</span> to another ingredient, representing the water being absorbed over time. <span class='inline-code'>drain</span> removes all water from the dish:

<div class='normal-gist'><code id="gist-6724018" data-file="15.clj"></code></div>

The recipe is therefore just a list of functions:

<div class='normal-gist'><code id="gist-6724018" data-file="16.clj"></code></div>

To work out how the dish changes over the course of its preparation, we just need to progressively apply each step to an initial state, which in this case is <span class='inline-code'>{:time 0, :temperature room-temperature}</span>. Clojure's standard library has a function called <span class='inline-code'>reductions</span> that does that for us, returning a list of all the successive states.

<div class='normal-gist'><code id="gist-6724018" data-file="17.clj"></code></div>

To prepare a receipe, we just need to take the final state:

<div class='normal-gist'><code id="gist-6724018" data-file="18.clj"></code></div>

One advantage of representing a process like this is that we are modelling each state explicitly. For example, if we wanted to calculate what ingredients had been added at a certain time in the preparation, we could. If our dish had been a mutable object, then each time we performed a new step in the recipe the old state would have been lost:

<div class='normal-gist'><code id="gist-6724018" data-file="18.clj"></code></div>

Paradoxically, by avoiding changing individual values, functional programming languages make representing change itself easier. Though functional programming can be used in any domain that object-oriented programming can, I have personally found that domains where time and change are important concepts are where functional programming languages like Clojure really shine.