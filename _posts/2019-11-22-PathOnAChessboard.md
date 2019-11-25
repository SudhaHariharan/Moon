---
layout: post
title: "Path on a Chessboard"
date: 2019-11-22
excerpt: "Path on a Chessboard Puzzle."
tags: [Puzzle, Math]
comments: false
---
## Path on a Chessboard
Alice begins by marking a corner square of an (n,n) chessboard; Bob marks an orthogonally adjacent square. Thereafter, Alice and Bob continue alternating, each marking a square adjacent to the last one marked, until no unmarked adjacent square is available at which time the player whose turn it is to play loses. 
For which n does Alice have a winning strategy? For which n does she win if the first square marked in instead a neighbour of a corner sqaure?

## Solution
If n is even, Bob has a simple winning strategy no matter where Alice starts, He merely imagines a covering of the board by dominoes, each domino covering two adjacent squares of the board. Bob then plays in the other half of each domino started by Alice. (Note that this works for Bob even when Alice is allowed to mark any square she wants at each move!)

![Path on a Chessboard](https://github.com/SudhaHariharan/sudhahariharan.github.io/blob/master/assets/img/Pathonachessboard.png?raw=true)

 
When n is odd, and Alice begins in a corner, she wins by imagining a domino tiling that covers every square except the corner in which she starts.

However, Alice loses in the odd n case when she must start in a square adjacent to the corner. Suppose the corner squares are black in a checkerboard colouring, so that her starting square is white. There is a domino tiling of the whole board minus one black square; Bob wins by completing these dominoes. Alice can never mark the one uncovered square because all the sqaures she marks are white. 


###### Source: 
Mathematical Puzzles by Peter Winkler