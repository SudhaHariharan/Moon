---
layout: post
title: "Coins in a Row"
date: 2019-10-10
excerpt: "Coins in a Row Puzzle."
tags: [Puzzle, Math]
comments: false
---

#### Coins in a Row

On a table is a tow of fifty coins, of various denominations. Alice picks a coin from one of the ends and puts it in her pocket, then Bob chooses a coin from one of the (remaining) ends, and the alternation continues until Bob picks the last coin. 
Prove that ALice can play so as to gaurantee at least as much money as Bob.

#### Solution
If the number of coins in even then Alice and Bob end up with the same number of coins.
If the number of coins is odd then if Alice starts, she ends up with more coins than Bob. 

If the number of coins is even, and they are of the same denomination, then Alice and Bob end up with the same amount of money.

The number of coins is 50 which is even. Since, Alice starts first she can chose all the odd numbered coins (1,3,5,...), if she starts by picking coin 1 or the even numbered coins (2,4,,6..) if she starts by picking coin 50. In both cases, Bob is forced to chosse the opposite numbered coins. Alice can compute the sum of all odd-numbered coins and the even-numbered coins and decide which gives her at least as much as Bob.

#### Variation
What is the game has 51 coins?

#### Solution 
If there are 51 coins instead of 50, it is usually Bob who will have the advantage, despite collecting fewer coins than Alice (He can choose odd or even number of coins from the remaining 50 coins after Alice has picked the first one). 

##Python implementation
```
import random
NUMBER_OF_COINS = 50
denominations = [100,5,25,10,5]
coin_row = []

for i in range(NUMBER_OF_COINS):
    coin_row.append(random.choice(denominations))

alice_coins = []
bob_coins = []

#Without any strategy 
nxt = 'ALICE'
for i in range(NUMBER_OF_COINS):
    choice = [coin_row[0],coin_row[-1]]
    index = random.choice(range(len(choice)))
    print(index, choice[index])
    
    if(nxt == 'ALICE'): 
        alice_coins.append(choice[index])
        nxt = 'BOB'
    else:
        bob_coins.append(choice[index])
        nxt = 'ALICE'
        
    del coin_row[index]
	
print(sum(alice_coins))
print(sum(bob_coins))

#to ensure alice gets atleast as much as BOb, she must choose the odd numbered coins or even numbered coins
if(sum(coin_row[1::2]) > sum(coin_row[0::2]) ):
    start_index = 1
else:
    start_index = 0
    

for i in range(start_index,len(coin_row),2):
    alice_coins.append(coin_row[i])
    
#delete all coins pushed to alice_coins
del coin_row[start_index::2]

#move the remains coins to Bob 
bob_coins = coin_row.copy()
coin_row.clear()

print(sum(alice_coins))
print(sum(bob_coins))
```

#### More reading
https://www.mimuw.edu.pl/~idziaszek/termity/termity.pdf


###### Source: Mathematical Puzzles by Peter Winkler