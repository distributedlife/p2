---
layout: post
title: "Uncovering your data's dark matter"
date: 2013-05-11 10:17
comments: true
author: Jennifer Smith
categories:
---
"Lateral thinking is... concerned with breaking out of the concept prisons of old ideas. This leads to changes in attitude and approach; to looking in a different way at things which have always been looked at in the same way." - Edward De Bono - Lateral Thinking: A Textbook of Creativity

The data created by your applications is a rich source of information that you can use to know and understand your customers better. Not just application data but logging data and usage data, like Google Analytics, can be provide a competitive advantage if you can exploit them.

I was working with a client recently who wanted to do just that. They had several years worth of transactional data that they knew contained a lot of interesting information. Information about how their users interacted with the site and with each other. Unfortunately, their existing database did not make it easy to perform this analysis. 

This is not an uncommon problem. The decisions about how you organise your data and your choice of data-store - whether a traditional relational database or one of the newer NoSQL options - will be made to optimise for your application.

The optimisation and organisation of a data-store constrains our ability to analyse and explore the data. In our case, trying to query interactions and relationships between users in the existing, relational database descended into complicated join statements and temporary tables. Aside from the performance, the complexity of the SQL statements made the whole venture extremely frustrating.

So we had the data and a suspicion that there was value hidden within and the existing data-store was preventing us from accessing it. We decided that we had to break the data out of it’s existing structure and find a new way to model it. And that was what we did.

As a proof-of-concept, we took two years of data and turned it into a graph database. Immediately we were able to see the data in a new light. Having the data in a graph opened up a wealth of new ideas and possibilities we had not thought of before this exercise. We were able to traverse relationships between users that were so difficult in the data's original setting. It's worth noting that we didn't spend a long developing a mature Extract-Transform-Load (ETL) process. It was more important to us to get feedback quickly and validate the approach.

A graph database stores data as nodes and relationships. If we wanted to query the relationships between users and parts of the site, it would help to use a structure where these relationships were modelled as first-class entities rather than being relegated to foreign keys and many-to-many tables. 

The following is an example of the kind of insight we found when looking at our data as a graph. Imagine you are analysing purchase data for an online record store and you want to find out a little more about your customer's buying habits. A customer's purchase of an album might be represented as follows.

(jen)-[:bought]->
       ({title:"Selected Ambient Works: 85-92"})-[:performedBy]->(aphexTwin)

Round parentheses denote nodes, square parentheses denote relationships.

As it stands, this probably closely resembles the original, relational database structure. Things start to get interesting when we begin to overlay new relationships. For example, we could infer that I like Aphex twin if I have bought two of his albums:

(jen)-[:bought]->
({title:"Selected Ambient Works: 85-92"})-[:performedBy]->(aphexTwin)
(jen)-[:bought]->
({title:"Classics"})-[:performedBy]->(aphexTwin)

=> (jen)-[:isAFanOf]->(aphexTwin)

Now from a simple database of music purchases, you can build up a graph of users and their preferred artists. It goes beyond that. You can start to compare different users by their proximity in this graph:

(jen)-[:isAFanOf]->(aphexTwin)<-[:isAFanOf]-(bob)-[:isAFanOf]->(squarepusher)

Perhaps I would enjoy Squarepusher too as Bob - a fellow Aphex Twin enthusiast - is a fan.
We can figure out how musically similar Aphex Twin and Squarepusher were using a shortest path calculation. Groups of artists could be clustered by the tastes of their fans. You could use calculate the clustering coefficient to measure whether your users have a broad range of tastes or whether they are all really into Drill n' Bass.

This example shows the ability to combine both an awareness of what the data represents with concepts that arise purely through how it is represented. In our case, storing data as a graph allowed us to tap into graph theory algorithms and concepts that inspired us to explore the data in ways we had not thought of before.

Graphs are a powerful way of modelling your data, but there are many other options. Relational databases are great for aggregating and grouping tabular data. Document databases are a great way of storing loosely structured sets of data. Newer stores like Datomic organise data into time-based, immutable 'facts'. Changing the way you store data will help you see things you didn't see, give you great ideas and inspiration. 

“A moment's insight is sometimes worth a life's experience.” - Oliver Wendell Holmes, Jr. 

Author: Jennifer Smith
