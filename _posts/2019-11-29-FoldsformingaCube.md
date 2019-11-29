---
layout: post
title: "Folds forming a Cube"
date: 2019-11-29
excerpt: "Folds forming a Cube Puzzle."
tags: [Puzzle, Math]
comments: false
---

### Folds forming a Cube
Take a square paper of size S*S units and thickness 1 unit.
How many half folds shoudl we do to form a cube out of it?

Consider infinitely foldable paper.

### Solution

Consider the volume of the paper which is S×S×1=S^2

Therefore the resultant cube side is cuberoot(S^2)

After N pairs of folds the side length is S/(2^N)

So S/(2^N)=cuberoot(S^2)

So S=2^3N

So N=logS/(3×log2)
Or N=logS/log8

Number of half folds will be 2.logS/log8

### Source
puzzling.stackexchange.com