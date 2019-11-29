---
layout: post
title: "Locker Doors"
date: 2019-11-29
excerpt: "Locker Doors Puzzle."
tags: [Puzzle, Math]
comments: false
---
### Locker Doors

Lockers numbered 1 to 100 stand in a row at the school gym. When the first student arrives, she opens all the lockers. The second student then goes through and recloses all the even-numbered lockers; the third student changes the state of every locker whose number is a multiple of 3.
This continues until 100 students have passed through. Which lockers are now open?

### Solution
Take for instance locker number 45. It is toggled in the 1st, 3rd, 5th and 9th walk. 
Locker number n is toggled for every k divisor of n. Divisors usually come in pairs {j,k} where j.k = n.

For 45 the pairs would be {5,9},{15,3},{45,1}
The net effects of j and k on this locker would locker would be nil (One opens, the other closes it back)

The exception is when n is a perfect square. For example locker number 16 ; the pair {4,4} means only one student 4 changes the state of the locker. 

Therefore, the lockers that are open at the end are exactly the perfect squares: 1,4,9,16,25,36,49,64,81, and 100 

### Source
Mathematical Puzzle by Peter Winkler
