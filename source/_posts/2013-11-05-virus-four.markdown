---
layout: post
title: "Virus V - Metamorphism"
permalink: /issue06/virus-five
byline: John Stojanovski and Nick Thorpe
category: issue06
authors:
    - name: John Stojanovski
      twitter: jotsnhoj
      avatar: john-avatar.jpg
    - name: Nick Thorpe
      twitter: agileboardhacks
      avatar: nick-avatar.png
---
Stealth viruses use misdirection to hide in plain sight. With infection, they attach themselves to your programs. Metamorphic viruses take this stealth approach to its endgame.

This species of malware represent the internal flow of the virus in a meta language, and with this, they can recombine real processor instructions which vary every single time. The Zmist virus, written by the Soviet genius 'Z0mbie' is still considered the ultimate metamorphic malware. Z0mbie's Mistfall engine can decompile an application into its smallest elements and then recompile the application, weaving itself into the fabric of the host. 

Mistfall will break  your friendly windows or DOS program into tiny code elements which are called "basic blocks".  Basic blocks are the smallest chunk of code that doesn't start with a branching instruction but ends with some sort of branching instruction.  And woven in between these blocks of real code will be blocks of polymorphic Zmist virus. The Mistfall engine actually looks at the basic blocks of code in your program, and tries to optimise them to create space for itself, so as not to increase the size of the original file. 

Finally, it links all these hidden blocks of Zmist together using a meta-language which describes the flow between them, and hides this code too. Zmist even protects itself with structured error handling in case any errors do occur. The original executable will be deleted, and the infected one will be sitting in its place. By design, Z0mbie has ensured every single infection will be different, so there will be no predictable signature.

When the Mistfall engine has done its job, Zmist will be scattered in tiny chunks all throughout your program. And when its all recombined – the host program and the virus, all pointers to data and code are redirected, so everything works just like before. 

Or so it seems. 