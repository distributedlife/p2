---
layout: post
title: Deployment Options
permalink: /issue04/deployment-options/
byline: Ryan Boucher
page: 7
pagetotal: 10
issue: Issue 04, September 2013
issuelink: /p2/issue04/index/
prev: /p2/issue04/rounded-bias/
nxt: /p2/issue04/improve-this/
authors:
    - name: Alex Ong
      twitter: ong_a 
      avatar: alex-avatar.jpg
    - name: Ryan Boucher
      twitter: distributedlife
      avatar: ryan-avatar.jpg
---
How we deploy changes to our applications, systems and environments has changed over the years; from using tools like rsync to put applications in the correct location, through to recent developments such as whole environment provisioning. With any new technology, there is the perception that it represents progress. If you're not doing whole environment provisioning, you might be wondering what you are missing out on. Alex Ong, who is with me today, is going to talk deployment options and how there is no single answer.

On Alex's current project, he is using a handcrafted shell script that run against a platform image. "You might think that such a process is antiquated", says Alex, "however the we determined with the client to run that way. We have a platform image already created and we can safely make assumptions about it. I just need to run one thing and the application is deployed. The constraint we had was that we had some dynamic work to do, so making our own image wasn't an option".

So, how did Alex come to this decision? What were the factors that helped him choose from the myriad of deployment options now available to us?

### Rate of change and scale
There are two key factors to consider when determining which are the most appropriate build options for your application. These being the rate of change and scale:

"When you want to deploy every week, or even every month, spending a week for each deployment isn't going to cut it. That's one factor – your rate of change. The other factor is scale. If you have to set up 2,000 machines, doing it by hand isn't going to work."

Alex says the rate of change and scale can be further broken down into four key questions:  what are the different types of changes, what changes happen most often, what changes are most important and, how soon do those changes need to propagate? Lets look at each of these and what options they present to us.

**What are the different types of changes?**

There are three types of changes that you could have in your system – application, server (or machine) and environment. Application changes can be actual code or the configuration of your application such as integration points, runtime config or feature toggles. Server or machine configuration and environment configuration changes include network, load balancers, firewalls, proxies and scaling up new instances. 

Each type of change may require it's own deployment mechanism.

**What changes happen most often?**

How often you deploy application or system changes can be dramatically different. "Here I'm talking about us deploying new app-code once a week, but Linux system changes might go once a month and our app tier is scaled with load multiple times a day", says Alex. 

Being able to get your change out on time will influence how you deploy.


**What changes are most important?**

Alex says deciding on the most important changes is really about prioritisation. "We might have a security fix we have to get out now, new functionality to be released this week and a CSS tweak that can wait".
Can you get out important changes when you need to?


**How soon do those changes need to propagate?**

Finally, how quickly you want changes to propagate will affect your decision. Alex points out that it's sometimes the case that "a bug fix needs to be deployed on all nodes immediately but the application updates can be rolled out over the course of a day".

Does your deployment mechanism allow you to get changes quickly if need be?


### Deployment Options
Depending on the flexibility you want in making your application and system changes, Alex says you have, at a high level, five deployment options: the File Copy Model, shell scripting, using a config management tool, VM provisioning and whole environment deployment.

**File Copy Model**

The most simple of these is the File Copy Model using rsync or Capistrano. "It's very fast and you can get from development to production in seconds" says Alex. This simple approach is fast - however has some disadvantages. "The downside is that you need direct access to production systems, and this encourages snowflakes because you just log in and fix that one thing." This approach also scales poorly as some other mechanism needs to build the base machine before the deployment package is deployed.

**Shell Scripting**

Shell scripting is something most deployment teams have done at some point in their history. They're quick to write, easy to change and easy to version control. Like the File Copy Model, shell scripting requires remote access to each machine resulting in snowflakes - and  it scales poorly. The strong point of this model is that it extends beyond non-trivial file copying quickly and easily.

**Configuration Management**

Straddling the middle ground between flexibility and speed are tools like Chef and Puppet. These options do not require you to have remote access to each machine. Both allow for highly customisable deployment processes and scale much better than scripting.

**VM Provisioning**

Once a Virtual Machine image has been created it’s effortless to deploy and very easy to scale. This is the significant benefit of this approach. If you have to add another 50 nodes to your cluster, it's as simple as spinning up a new server based on the image. The downside is that images can take a relatively long time to produce and there will be a lag between when a change has been committed, to the point it's ready to be deployed. This lag time means that changes to each machine are slower to propagate as a new image needs to be created and each server restarted with the new image.

**Whole Environment Deployment**
This strategy allows us to build up a second copy of production as the ‘future state’. When it comes time to switch from current to future the traffic is redirected. This approach is good when your deployment takes time and you can’t afford a down time.

-> ⁂ <-

This brings us back to Alex's current deployment choices. "We have a base image that handles dependencies and changes infrequently." he says. "Our application changes more frequently and does dynamic work on deployment. This meant that virtual machine images were not a good choice. The simplest of deployment scripts is all we need."	
