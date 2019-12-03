---
layout: post
title: "Sums and Differences"
date: 2019-12-03
excerpt: "Sums and Differences."
tags: [Puzzle, Math]
comments: false
---
### Sums and Differences
Given 25 different positive numbers, prove that you can choose two of them such that none of the other numbers equals either their sum or their difference. 

### Solution

Let the numbers be {x<sub>1</sub>, x<sub>2</sub>, ..... x<sub>n</sub>} where n = 25. 
Let the numbers be such that x<sub>1</sub> < x<sub>2</sub>  ..... < x<sub>n</sub>

Assume we cannot choose x<sub>n</sub>. For every x<sub>i</sub> there must be a x<sub>j</sub> such that 

	x<sub>i</sub> + x<sub>j</sub> = x<sub>n</sub>.
	
The first 24 numbers are paired in such a way that :

	x<sub>i</sub> + x<sub>n-i-1</sub> = x<sub>n</sub>
	
Now consider x<sub>n-1</sub> together with any of x<sub>2</sub>,...x<sub>n-2</sub>; these pairs sum to more than 

	x<sub>n-1</sub> + x<sub>1</sub> = x<sub>n</sub>.
	
and so x<sub>2</sub>,...x<sub>n-2</sub> must also be paired, this time satisfying

	x<sub>2+i</sub> + x<sub>n-i-2</sub> = x<sub>n-1</sub>
	
But this leaves x<sub>(n-1)/2</sub> paired with itself, so the numbers x<sub>n-1</sub> and x<sub>(n-1)/2</sub> solve the problem. 

### Source
Mathematics Puzzles by Peter Winkler