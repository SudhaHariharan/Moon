---
layout: post
title: "The Shoelace Algorithm"
date: 2019-11-06
excerpt: "The Shoelace Algorithm"
tags: [Algorithm, Math]
comments: false
---
## The Shoelace Algorithm

The Shoelace formula is a mathematical algorithm to determine the area of a simple polygon whose vertices are described by their Cartesian coordinates in the plane.

![alt text](https://github.com/SudhaHariharan/sudhahariharan.github.io/blob/master/assets/img/shoelace1.PNG?raw=true)

The method consists of cross multiplying corresponding coordinated of the different vertices of a polygon to find its area. It is called the shoelace formula because of the constant cross-multiplying for the coordinates making up the polygon like tying shoelaces.


![alt text](https://github.com/SudhaHariharan/sudhahariharan.github.io/blob/master/assets/img/shoelace2.PNG?raw=true)

To apply the shoelace algorithm you will need to:

List all the vertices in anticlockwise order. (e.g. A,B,C,D,E) in a table, and note the x and y coordinates in two separate columns of the table,
Calculate the sum of multiplying each x coordinate with the y coordinate in the row below (wrapping around back to the first line when you reach the bottom of the table),
Calculate the sum of multiplying each y coordinate with the x coordinate in the row below (wrapping around back to the first line when you reach the bottom of the table),
Subtract the second sum from the first, get the absolute value (Absolute dfference |sum1-sum2|,
Divide the resulting value by 2 to get the actual area of the polygon.

![alt text](https://github.com/SudhaHariharan/sudhahariharan.github.io/blob/master/assets/img/shoelace3.PNG?raw=true)

## Proof

https://artofproblemsolving.com/wiki/index.php/Shoelace_Theorem

## Python Implementation
```
#vertices is the array of all the vertices of the polygon
def PolygonArea_Shoelace(vertices):
    n = len(vertices) #no of vertices
    
    area = 0.0
    
    for i in range(n):
        j =  (i+1)%n
        area += vertices[i][0]*vertices[j][1]
        area -= vertices[i][1]*vertices[j][0]
    
    area = abs(area)/2.0
    return area
	
vertices = [(3.0, 4.0), (5.0, 11.0), (12.0, 8.0), (9.0, 5.0), (5.0, 6.0)]
print(PolygonArea_Shoelace(vertices))
```
It is possible that the above implementation can generate an overflow error since calculating different sums can potentially lead to very high numbers. 

## References:
1. https://www.101computing.net/the-shoelace-algorithm/
