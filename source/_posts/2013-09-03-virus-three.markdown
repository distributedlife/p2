---
layout: post
title: "Polymorphism: The arms race heats up"
permalink: /issue04/virus-three
byline: John Stojanovski and Nick Thorpe
page: 2
pagetotal: 10
issue: Issue 04, September 2013
issuelink: /p2/issue04/index/
prev: /p2/issue04/3d-cardwall/
nxt: /p2/issue04/build-gripes/
authors:
    - name: John Stojanovski
      twitter: jotsnhoj
      avatar: john-avatar.jpg
    - name: Nick Thorpe
      twitter: agileboardhacks
      avatar: nick-avatar.png
---
The battleground is the PC. That’s where the virus installs itself. That’s where the anti-virus lives too. The virus must get safely behind enemy lines without detection, and then execute its payload. The anti-virus must survive in the same environment as the virus. 

The first viruses were unencrypted code which ran on the infected computer. These first exploratory efforts created the anti-virus industry itself. The Brain virus even included the name and address of the authors. The first anti-virus products would simply look for these known pieces of code, and wipe them out.

> "a sinister advance from the virus makers"

Then the virus makers began to encrypt this code so that, while it was lurking on a hard drive, or on a floppy disc, it was much harder to spot. The anti-virus could not simply look at files on the computer for a match to a fixed template. The virus had to execute, though, to achieve its mission, and to do this, it has to decrypt itself into code which the processor can execute. It had to turn back into executable code. Antivirus researchers like me  would get the virus to execute, then dump the contents of memory to see it emerge in its malevolent, unencrypted state.

When static encryption, where the key which scrambles the code is always the same, would no longer work the virus developers switched to dynamic encryption, where the key changes each time the virus executes. With every new attack came an anti-virus counter-punch. And at each turn, the virus makers are watching and learning from each new defence created by the anti-virus companies.

Then, a sinister advance from the virus makers. A worrying new form of virus emerged in the wild. A change from dynamic key encryption, where it's just the key which is changing, to polymorphism, where the whole method of encryption, the encryption algorithm, is changing with every infection. Undetectable. Polymorphism was the new weapons platform for the virus makers.

When they realised polymorphism had arrived, the anti-virus industry needed to retaliate. They built, in software, something which would emulate a limited set of instructions of the processor itself. Which would look like the processor in your computer to the virus. Then, when the virus decrypted itself in order to execute, the antivirus, watching the *fake* processor, could spot the fingerprint of the virus as it decrypted itself and displayed its true form. This tactic was known as emulation.

“So the bad guys recognised — ‘oh there’s some emulation happening here’, looked at the situation and thought: ‘how do we defeat an emulator?’“

Ever wonder why anti-virus software seemed to slow down your computer, especially when you inserted a disc? Did you want to turn it off? The virus makers had found a new weakness: the patience of computer users.

“Ultimately an antivirus product has to make the call on each individual file it encounters, and it only has a split second to do so. If it takes too much time, people get bored and turn the antivirus off. So the bad guys were putting in infinite loops that do nothing at all but waste time— and because emulation is quite slow… people would turn their [anti-virus] stuff off.“

After this looping attack had been around for a while, and the antivirus makers had put in their defence, the virus makers didn’t take long to respond. When they did they attacked on two fronts.

“An emulator has to try and protect itself from infinite loops — imagine a piece of code that constantly loops over and over and over. So what happens — there’s usually a depth that’s associated with a number of instructions that will execute or recur to… what they would do is figure out what the limit of the instructions that the emulator would execute. It might be 50,000, 30,000, 10,000, 5,000.  Whatever it is — and then simply create that many garbage instructions to try and get around that.”

The second front was attacking the emulator itself. “… an emulator is just another piece of software, so it’s prone to bugs. If they could find a bug in the emulator, they could take advantage of that to execute basically breakout of the sandbox. They would execute in the context of the anti-virus that’s running. Which is usually elevated.” The virus now has hijacked the trust given to the *anti-virus* system, and it has the full privileges which are given to that system.

“Not that it was a big deal back in those days as everything was really running as root in DOS. “ Now the virus is running with elevated privileges. It can do whatever it likes.

And so the emulator bugs were plugged. And more were found, and exploited. 

The cycle continued until Stealth.