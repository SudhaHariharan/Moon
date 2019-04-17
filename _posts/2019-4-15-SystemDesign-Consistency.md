---
layout: post
title: "System Design Foundations - Part 2 - Consistent Hashing"
date: 2019-04-15
excerpt: "Understanding consistent hashing."
tags: [System Design, database]
comments: true
---

In many high-traffic applications and websites, the load balancing of servers is handled through and algorithm called consistent hashing. 

In this post we review the basics of Hashing, the motivation behind consistent hashing and how consistent hashing helps distribute load to multiple servers. 

# What is hashing and Hash tables 

In simple terms, hashing means taking an input string and converting it into an output of a fixed length. A hash function is used to transform the input string into an output string or integers of the desired size. For example, a hash function could be used to map the string 'hello' to a number, lets say '34'. It is possible that a hash function can produce the same output for different input string. This is refered to as *collision*. Good hash functions must ensure somehow that the input data is 'hashed' in such a way that the outputs are spread as evenly as possible over the output range.

One of the common use of hash functions is to build *hash tables*. 

A hash table is a data structure that is used to store key/value pairs. (Key - inputs, Value- hashed output).It uses a hash function to compute an index into an array in which an element will be inserted or searched. By using a good hash function, hashing can work well. Under reasonable assumptions, the average time required to search for an element in a hash table is O(1).

Mapping the hash function output directly to the index of an array has its issues. 
1. Usually, a good hash function has a wide output range, so building an array for all possible indices would be impractical. Instead, we can have a reasonably sized array (size M) and perform a modulo operation on the hash to get the array index. So, the array index would be hash(key)%M. 
2. Object hashes will not be unique and there is a possibility of collusions. Therefore mapping directly to indexes will not work. There are many ways of handling this. One way is to attach a list (*bucket*), to each array index to hold all the objects sharing a given index. 

So where does all this fit in the distributed load balancing scheme of things?

## Consistent Hashing

Let us start with a cluster of m(0,1,---,m-1) computers. Let us say we have 5 servers with IDs (S0, S1, S2, S3, S4) that serve the requests. 

The basic idea behing consistent hashing is that both the request objects and the servers are mapped onto the same hash space. 
![Consistency Hashing](https://github.com/SudhaHariharan/sudhahariharan.github.io/blob/master/assets/img/Consistency%20Hashing%201.PNG)

Consider a ring (known sometimes as the *hashring*) where all the server nodes are placed. The server nodes can be placed at random locations on this ring. The random location is chosen by the hash function. The requests are also placed on the same ring. 

When a request arrives, we traverse clockwise and let the first server in the path to handle the request. Traversal through the ring is clockwise and hence the request with the highest address node is served by the server node with the least address, as shown in the illustration. 

The points are randomly distributed across the ring, so this means that each server will probably recieve a more distributed load. Theoritically, this corresponds to 1/m where m is the number of requests. 

![Consistency Hashing](https://github.com/SudhaHariharan/sudhahariharan.github.io/blob/master/assets/img/Consistency%20Hashing%202.PNG)
Suppose we add a server to the ring. Most of the servers are completley unaffected by this change. Only one machine is now sending request to S5 instead of S0. In general the number of key-value pairs that needs to be moved to new machines will typically be 1 / (n+1) of the total. This is a small fraction. 


![Consistency Hashing](https://github.com/SudhaHariharan/sudhahariharan.github.io/blob/master/assets/img/Consistency%20Hashing%203.PNG)
Suppose we remove a server from the ring. If one server goes down, the earlier request is now routed to the server next in the ring. Like before, the change is usually a small fraction. 

The method of consistent hashing descriped above isnt ideal. For example if a server is mapped to very nearby points in the circle, then one of the servers may end up with very few requests while some other servers may have more. Also, when adding or removing servers the input keys come from one or only a few other machines. Ideally the input keys would come in a more balanced fashion. 

This problem can easily be resolved though. Instead of mapping a server to one point on the ring, we would map it to multiple points in the circle. By adding these replicas we increase the uniformity with which the input requests are distributed. Also, when a server is added or removed, only a small number of requests (\Theta(1/rn)) are redistributed to(or from) that server, froom each of \Theta(r) other servers in the cluster

## Consistent Hashing in real life
There are a number of live systems which use consistent hashing including:

Couchbase automated data partitioning
Partitioning component of Amazon's storage system Dynamo
Data partitioning in Apache Cassandra
Riak, a distributed key-value database
Akamai Content Delivery Network
Discord chat application


### References and Useful Links:
1. https://www.hackerearth.com/practice/data-structures/hash-tables/basics-of-hash-tables/tutorial/
2. http://michaelnielsen.org/blog/consistent-hashing/
3. http://www.tomkleinpeter.com/2008/03/17/programmers-toolbox-part-3-consistent-hashing/
4. https://www.akamai.com/us/en/multimedia/documents/technical-publication/consistent-hashing-and-random-trees-distributed-caching-protocols-for-relieving-hot-spots-on-the-world-wide-web-technical-publication.pdf



