---
layout: post
title: "The one hundred drawers"
date: 2019-11-08
excerpt: "Prisoner Puzzle."
tags: [Puzzle, Math]
comments: false
---
## The one hundred drawers 
A cabinet with a hundred drawers, each numbered from 1 to 100 stands in an otherwise empty room in a prison. The warden enters the room, writes down the names of 100 prisoners on separate pieces of paper and distributes the pieces of paper randomly in the cabinet so that each drawer contains the name of one prisoner.
The warden exits the room and assembles the 100 prisoners whose names she wrote on the slips of paper. She tells them that they will each be let into the cabinet room, one after the other; once in there they are permitted to open 50 drawers and look at the names on the pieces of paper inside. She adds that if every single prisoner opens the drawer containing his name, everyone will be freed. But if at least one prisoner doesn't open the drawer with his name in it, everyone will be killed.
The prisoners are allowed to think up a strategy before they go into the cabinet room, but once the first prisoner goes in they are not allowed to communicate in any way. They cannot leave messages in the room, nor tell prisoners what they saw once they leave the room. 
Can you find the strategy that gives a chance that gives a chance of survival of more than 30 percent?

## Solution
If a prisoner choses 50 out of 100 boxes at random, the chance that one of these boxes contains his name is 50 out of 100, or 50 percent. If all 100 prisoners were to choose 50 boxes at random, the probability of everyone choosing their name would be

50 % (50 % ( 50 % .... repeated 100 times
which is 1/2<sup>100</sup> = 0.00000000000000000000000000000008

The strategy that the prisoners must take is the following:
First, they must number themselves from 1 to 100 - That is label themselves prisoner 1, prisoner 2, prisoner 3..and so on. 
Then, they must agree to abide by these riles when they enter the room:

1. Each prisoner heads for the drawer with their number on it and opens it first. That is, the first drawer Prisoner 1 opens is drawer 1, the first drawer Prisoner 2 opens is drawer 2 and so on.
2. If a prisoner opens a drawer and it contains the name of another prisoner, say Prisoner k, the next drawer they open should be drawer k. 

Imagine there are only 10 drawers and 10 prisoners. For example, in drawer 1 is the name of Prisoner 4, in drawer 2 is the name of prisoner 8 and so on. 

| Drawer number   	| 1 	| 2 	| 3 	| 4 	| 5 	| 6 	| 7  	| 8 	| 9 	| 10 	|
|-----------------	|---	|---	|---	|---	|---	|---	|----	|---	|---	|----	|
| Prisoner number 	| 4 	| 8 	| 5 	| 6 	| 9 	| 1 	| 10 	| 2 	| 7 	| 3  	|

If prisoner 1 abides by this strategy, he begins by opening drawer 1, in which he finds the name of prisoner 4. THen he opens drawer 4 where he finds 6. He then opens drawer 6 in which he finds his own name. He has gone through the cycle 1 -> 4 -> 6 -> 1 and has found his own name after opening three drawers. 

We can see what happens to the other prisoners by following the cycles of this permutations. The number of drawers a prisoner must open to find his own name is equal to the length of the permutation cycle he finds himself in. The strategy counts him round the cycle drawer by drawer, and he finds his name when he completes the cycle. This observation is also true when we increase the number of drawers and prisoners to 100. 

If there are 100 prisoners, and each prisoner can only open 50 drawers, every prisoner will find his own name if and only if all the permutation cycles have a length of at most 50. If the length of a cycle is longer than 50, a prisoner wont be able to travel round it only 50 drawer openings. The strategy works, if no permutation cycles are longer than 50. 

This also means that there can be only one permutation chain in any set that is longer than 50 drawers. There are 100 drawers in total, so if there is one cycle that is longer than 50, then the others must be less than 50 in total. 

For success, the maximum permutation chain length should be less than or equal to 50, and there can be only be one chain that has greater than 50, then we calculate the probability of success assembles
Pr<sub>win</sub> = 1 - Pr<sub>chance of a chain longer that 50</sub>

Therefore we must calculate the probability of a long chain.
For a chain of length *l*, the number of ways the drawers can be arranged is (100 choose l): 100C*l*
In there, there are (l-1)! ways to arrange the numbers. 
The remaining numbers can be arranged in (100-l)! ways

Combining these, the number of permutations that contain a chain of length l > 50 it
100C*l* (l-1)!(100-l)! = 100!/l 

There are 100! ways of arranging the numbers, so the probability there is a chain of length l is just l/l. This is fascinating because this is independent of the number of drawers.

Since we know there can be only one way for chain of having length > 50
Pr<sub>win</sub>  = 1 - [1/51 + 1/52 + 1/53+...1/99+1/100] = 0.31183

###### Source: So you think you've got problems? by