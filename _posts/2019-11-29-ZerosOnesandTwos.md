---
layout: post
title: "Zeros, Ones, and Twos"
date: 2019-11-29
excerpt: "Zeros, Ones, and Twos Puzzle."
tags: [Puzzle, Math]
comments: false
---
### Zeros, Ones and Twos

Let n be a natural number. Prove that
1. n has a nonzero multuple whose base 10 representation contains only zeros and ones.
2. 2<sup>n</sup> has a multiple whose representation contains only ones and twos. 

### Solution 

Part 1.

Consider the 'pigeon hole principle': If there are more pigeons than holes, then some hold must contain at least two pigrons. 

List all the number 1,11,111,...,111..1 where the last one contains n +1 ones.
Look now at their remainders when divided by n. By the pigeonhole principle, two of them have the same remainder. Their difference is of the form 1111...110000...0 and is divisible by n.

As long as n is not a multiple of 2 or 5, you can even find a multiple of n whose representation (base 10) is all ones. The reason is that the above argument produces a multiple of n of the form 1111...110000...0; if there are k zeros at the end, dividing by 10<sup>k</sup> = 2<sup>k</sup>.5<sup>k</sup> leaves you all ones and still with a multiple of k. 

Part 2
It is perhaps easiest to show by induction on k that there is a k-digit number containing only ones and twos which is a multiple of 2<sup>k</sup>. Adding a 1 or 2 to the front of such a number increments it by 2<sup>k</sup>5<sup>k</sup> or by 2<sup>k+1</sup>5<sup>k</sup>, in each case preserving divisibility by 2<sup>k</sup>; since the two choices differ by 2<sup>k</sup>5<sup>k</sup>, one of them must actually achieve divisibiltiy by 2<sup>k+1</sup>


### Source
Mathematical Puzzle by Peter Winkler