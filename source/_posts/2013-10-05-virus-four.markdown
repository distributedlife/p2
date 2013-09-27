---
layout: post
title: "Hiding in Plain Sight: Stealth"
permalink: /issue05/virus-four
byline: John Stojanovski and Nick Thorpe
category: issue05
authors:
    - name: John Stojanovski
      twitter: jotsnhoj
      avatar: john-avatar.jpg
    - name: Nick Thorpe
      twitter: agileboardhacks
      avatar: nick-avatar.png
---
In November 1988,  the US admitted it had been designing and building stealth aircraft, and the world saw the freakish shape of the F-117 for the first time. And just one year after these aircraft made their first marks on the open sky, the malware makers came out with their own stealth weapons.

An old school boot sector virus would load when you booted a disc. With polymorphism, these viruses became harder to spot, as they were encrypted with a set of shifting keys. But ultimately, when they decrypted in memory, they were as easy to spot as a B-52 in a clear sky.

 A stealth virus is more like a parasite: it attaches to and grows into an existing program. When the program loads, it begins listening for requests to access the disk, which it intercepts. And then, it tells lies.

The hallmark of a stealth virus is misdirection. Think: "These are not the droids you’re looking for."  The stealth virus is the "man in the middle", providing misleading answers to requests for directions. Everyone who comes looking for it will be sent elsewhere.

With the virus resident in memory, when the operating system tries to read from the disk, it’s actually calling the virus for directions. There is a table of pointers which is called by the operating system when it wants to read from disk. The virus is already there, controlling the table. It intercepts your read request and shows you whatever it wants - and stores a copy of the original request within itself. So it’s going to do whatever it wants, and then send you on to the original location you asked for.

And if anyone happens to call at the *virus’s* address, looking for the original code, it simply points them to a new location, where it has stashed the code it replaced. So everything still executes just as before. No-one will see the virus payload itself, because it’s always giving the wrong directions, ensuring it can’t be seen.

If you’re a virus, your purpose is to replicate, to pass on copies of yourself. So with every call for disk access, the virus checks the disk, looking for its own signature. If it sees that it’s not living there already, it will infect the disk. Now that the disk is infected, it becomes the vector for new infections.

Stealthing usually refers to avoiding the anti-virus, but there’s a visual aspect to it too. The user can’t be allowed to notice you’re there either. Upon infection, a stealth virus looks around, moves some old code, and puts itself in that spot. Stealth viruses hide themselves within existing programs, but in doing so, they make the host program larger. 

But as the host program grew larger, users began to notice: "Hey, how come Lotus 1-2-3 just got bigger?" Especially in DOS, where the file size is spelled out as an exact number.  And so the practise of caving developed among the malware makers. When a virus uses caving as a stealth technique, it looks inside a host program for areas of unused space. DOS and Windows instructions needed to be aligned to 16 bit boundaries. If the instruction or data is smaller than that, the OS will pad out the rest with zeroes.  Large expanses of vacant, zeroed-out space.  And so virus builds itself into these caves of zeroes, hiding inside the program without enlarging the executable. 

The file size stays exactly the same, and you stay in the dark as to what dark thing is really living on your computer.