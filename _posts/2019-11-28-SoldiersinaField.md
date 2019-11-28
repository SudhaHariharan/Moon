---
layout: post
title: "Soldiers in the Field"
date: 2019-11-28
excerpt: "Soldiers in the Field Puzzle."
tags: [Puzzle, Math]
comments: false
---

#### Soldiers in the Field
An odd number of soldiers are stationed in a field, in such a way that all the pairwise distances are distinct. Each soldier is told to keep an eye on the nearest other soldier. Prove that at least one soldier is not being watched

#### Solution
Imagine 3 soldiers standing in a traingle with pairwise distances a,b,c such that a<b<c.
The soldiers on either side of a will watch other, while the third soldier will watch one of the first two. However, the third soldier is not being watched.
Extending this to any number of odd soldiers, the two soldiers at a shortest distrance from each other will watch each other. If anyone else is watching one of them, then we have a soldier being watched twice and therefore another not watched at all. Suppose we remove these two. This wont affect the others. Since the number of soldiers is odd, this procedure would eventually reduce to one soldier not watching anyone, a contradiction. 


#### Source
Mathematical Puzzles by Peter Winkler