---
layout: post
title: "Continuous Delivery on Windows, Part II: Deployment"
permalink: /issue07/cd-in-windows-part-2
subtitle: Standard packaging mechanism pipe dreams
byline: Rachel Laycock
category: issue07
authors:
    - name: Rachel Laycock
      twitter: rachellaycock
      avatar: rachel-avatar.jpg
---
This is where Continuous Delivery on Windows gets a little harder. It **should** be as easy as taking your packaged application and dropping it onto a server somewhere. You might want to configure and restart IIS, install and run your services or any other 3rd party software and services, run your database scripts and run a smoke test to check it is all functioning together as expected. This should be simple, but it isn't.

Taking your packages and copying them on the server is actually quite easy if you are using a packaging mechanism like MSI, for example. You can use Powershell or new kid on the block Octopus to do this.

### PowerShell

>> "PowerShell is a Powerful Language… but it's ugly, really ugly."

PowerShell has the ability to copy over your files, restart IIS, start your services and many other remote commands available on your server - given your server supports the remoting command you need. That given refers to earlier than Windows Server 2008. if you working with an older server, forget it! Although PowerShell is a **powerful** language it is ugly, really ugly. It is essentially a procedural scripting language similar to bash, which when used without care can turn into some really ugly and unmaintainable code. You can avoid some of this pain by Test Driving your code with tools like Pester. If you are writing PowerShell, I implore you to keep it as neat and understandable as possible and one of the next ways to do this is to TDD your code. Yes, PowerShell is code. No excuses.

### Octopus
Octopus is a new tool that installs tentacles onto your servers, setting up a remote connection. If you package your application with Octopak, it can also copy over your files and start IIS and other services. The advantage it provides is that you are doing less PowerShell scripting, but this tool is still in its infancy and for many tasks you will still need to call out to PowerShell.

## Pain
This all sounds pretty straightforward even if not ideal - haven't we got past shell scripting? But it starts to get really painful really quickly. As soon as you want to deploy something other than **your** application or components in fact. Something that someone else wrote that your application depends upon which, lets face it, is a very common requirement.

First of all, there isn't a common packaging mechanism in Windows. People use a combination of MSIs, NSIS, Nullsoft, Innosetup and more… and lets not forget plain old zips… eh.

Not all of those "packaging mechanisms" can be scripted or accessed through the command line and they often require a human to click a button to install. GUI installs are"really hard, if not impossible to automate. Some might provide command line scripted installs, but still offer less functionality than their GUI counterpart. NuGet is one example of this. 

So what can you do? You three options.

###1. Choose tools you can script and automate
If you do have the opportunity, make the automation and testing of 3rd party tools a first class concern, so that you can repeatedly deploy, configure and test without worrying about introducing any opportunity for human error. 

Let me introduce you to Chocolatey. A package install tool similar to Homebrew for mac, which lets you install system packages. It uses PowerShell scripts and NuGet to install system applications for you. The reason I talk about it here is that it could be the start of a standard packaging mechanism on the Windows platform and for that reason it is worth keeping an eye on.

Unfortunately using scriptable, automatable tools might be out of the question. The software may have already been purchased or may not exist in any scriptable format. In this case you could look to build it yourself.

### 2. Build it yourself, but better
If you can't buy, build. But build it with a common packaging mechanism like an MSI or even better take advantage of Chocolatey and the ability to deploy and configure it in a script - without human interaction. Or leverage an open source project and add features you need by contributing. However, that might also be out of the question, as it could be too expensive and time consuming. There is a reason you had to buy that 3rd party software or tool in the first place. In reality, for the time being you will probably have to live with your non automatable software. Sadness. But it isn't all doom and gloom…

>> "Enough of the GUI madness!"

### 3. Create the need for change
Much of the reason software on Windows doesn't have a common packaging mechanism or uses a GUI to install is down to the requirements of their customers. Once upon a time we didn't care or know to automate our deployments and we were content with just deploying them through the GUI one time only. OK. Maybe we weren't content but... So the vendors and tool makers met that need. However, the advent of CD and DevOps practices has changed and it is only with the push from their customers that will turn the tide and make the Windows ecosystem change.

-> ⁂ <-

Frankly, packaging and deployment on Windows is still really painful and what needs to change is the Windows Ecosystem as a whole. The only way to do that is to create the need and make the current packaging unacceptable. Enough of the GUI madness and please for the love of god can we standardise on package management! I have high hopes for Chocolatey, but for now let's get onto the really hard piece of CD on Windows. Infrastructure automation…

