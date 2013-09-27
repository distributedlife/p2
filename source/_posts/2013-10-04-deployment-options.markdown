---
layout: post
title: The future of deployment is remembering we have a past
subtitle: We have lots of deployment options now and some of them are shiny and new. It’s easy to forget that the best option might need to be dusted off from the bottom of the toolbox.
permalink: /issue05/deployment-options
byline: Alex Ong and Ryan Boucher
page: 3
pagetotal: 9
issue: Issue 05, October 2013
issuelink: /p2/issue05/index/
prev: /p2/issue05/cooking-with-clojure/
nxt: /p2/issue05/virus-four/
authors:
    - name: Alex Ong
      twitter: ong_a
      avatar: alex-avatar.jpg
    - name: Ryan Boucher
      twitter: distributedlife
      avatar: ryan-avatar.jpg
---
I was at a client when I overheard someone mention that virtual machine images are the deployment artifact of the future. I was excited to learn of this. Your build pipeline produces an image that you can spin up. Brilliant. I broached this with my friend Alex Ong who told me about *whole environment provisioning –*deployments where you can flick a switch, hardware or software, and you’re done*.* We’d gone a long way from bashing out write-once, read-never scripts with our fists and I’d missed much. I asked Alex what he was doing on his current client. "A shell script".

Oh.

"...wrapped in an RPM."

With any new technology, there is the perception that it represents progress. "You might think that such a process is antiquated", says Alex, "however we determined that in this specific case, this was the better option. We have a platform image already created for us which we can safely make assumptions about - I just need to run one thing and the application is deployed. One of our constraints was that we had some dynamic configuration to run after startup, so making our own image wouldn’t really have helped us there".

So it’s about the **best** deployment option, not the **latest**. I think i’m getting this. I asked Alex what were the factors that helped him choose from the myriad of deployment options now available to us?

"When you want to deploy every week, or even every month, spending a week for each deployment isn't going to cut it. That's one factor – your rate of change. The other factor is scale. If you have to set up 2,000 machines, doing it by hand isn't going to work."

> *With any new technology, there is the perception that it represents progress.*

Alex then tells me the rate of change and scale can be further broken down into four key questions: what are the different types of changes, what changes happen most often, what changes are most important and, how soon do those changes need to propagate? 

Lets look at each of these and what options they present to us.

### What are the different types of changes?

There are (broadly speaking) three types of changes that you could have in your system – application, server (or machine) and environment. Application changes can be actual code or the configuration of your application. These include: integration points, runtime config or feature toggles. Server or machine configuration and environment configuration changes include: network, load balancers, firewalls, proxies and scaling up new instances. 

**Alex’s advice: **Each type of change may require it's own deployment mechanism.


### What changes happen most often?

How often you deploy application or system changes can be dramatically different. "Here I'm talking about us deploying new app-code once a week, but Linux system changes might go once a month and our app tier is scaled with load multiple times a day", says Alex. 

**Alex’s advice: **Understand what you need to change and how often you need to do it.


### What changes are most important?

Alex says deciding on the most important changes is really about prioritisation. "We might have a security fix we have to get out now, new functionality to be released this week and a CSS tweak that can wait".

**Alex’s advice: **Can you get out important changes when you need to?


### How soon do those changes need to propagate?

Finally, how quickly you want changes to propagate will affect your decision. Alex points out that it's sometimes the case that "a bug fix needs to be deployed on all nodes immediately but the application updates can be rolled out over the course of a day".

**Alex’s advice: **Does your deployment mechanism allow you to get changes quickly if need be? Note: this ties into your app/environment architecture as well as your deployment mechanism.


## Deployment Options

Depending on the flexibility you want in making your application and system changes, Alex says you have, broadly, four deployment options: the File Copy Model, package deployment, VM provisioning and whole environment deployment.

### File Copy Model

The most simple of these is the File Copy Model using rsync or Capistrano. "It's very fast and you can get from development to production in seconds" says Alex. This simple approach is fast - however has some disadvantages. "The downside is that you need direct access to production systems, and this encourages snowflakes because you just log in and fix that one thing." This approach also scales poorly as some other mechanism needs to build the base machine before the deployment package is deployed.

### Package Deploys

Deployment should require as much effort and configuration as as ‘yum install business-value’. The package gives you this deployment simplicity whilst still retaining control over what needs to happen. "This is what we did", says Alex “We wrote a shell script and wrapped it in an RPM to simplify deployment”. The challenge of the package deployment process is that you will need a different package for each operating system you are targeting.

### VM Images

Once a Virtual Machine image has been created it’s effortless to deploy and very easy to scale. This is the significant benefit of this approach. If you have to add another 50 nodes to your cluster, it's as simple as spinning up a new server based on the image. The downside is that images can take a relatively long time to produce and there will be a lag between when a change has been committed, to the point it's ready to be deployed. This lag time means that changes to each machine are slower to propagate as a new image needs to be created and each server restarted with the new image.

### Whole Environment Deployment

This strategy allows us to build up a second copy of production as the ‘future state’. When it comes time to switch from current to future the traffic is redirected. This approach is great if you have complex interactions that need to be tested between different system components. All your ‘production’ machines themselves have passed all the quality gates before hitting live use including your environment configuration. The disadvantage is that it can be expensive to deploy a copy of your entire topology. 

-> ⁂ <-

This brings us back to Alex's current deployment setup. "None of the above were right for us, so we combined them to get the result we wanted." he says. “We have a base image that handles dependencies and changes infrequently. Our application changes more frequently than the base image and is required to do dynamic work on deployment. This meant that virtual machine images were not a good choice. We took our deployment script, wrapped it in a package. Done.“	
