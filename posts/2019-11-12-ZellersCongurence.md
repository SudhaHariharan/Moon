---
layout: post
title: "Zeller's Congruence"
date: 2019-11-12
excerpt: "Zeller's Congurence"
tags: [Algorithms, Math]
comments: false
---
## Zeller's Congruence

Zeller's congruence is an algorithm devised by the German Mathematician Julius Christian Johannes Zeller  in the year 1882 to calculate the day of the week for any Julian or Gregorian calendar date. 

For the Gregorian calendar, the formula looks like

day = ( d +  $\lceil 13(m - 2) / 5 \rceil$ + Y + $\lfloor Y/4 \rfloor$ -  $\lfloor Y/100 \rfloor$ + $\lfloor Y/400 \rfloor$) *mod7*

Here, Y is year, m is month and d is the day of the month. 

THe first thing to note is the modulo 7 operator wrapping the function. There are only seven days in the week and our final answer must be one of these. The mod 7 operation returns a value 0-6 which we can map to the contiguous days of the week. 

The next thing to note is that a year has 365 days (ignore leap years for now). 365 mod 7 = 1. This means that the day of the week advances by one day each year. If November 12th was a Monday last year, then this year it will be a Tuesday (provided this or the previous year is not a leap year). What this means is that there is a direct linear correlation between the year, and the output. For every +1 year, output increases +1 (modulo 7). In the formula the third term in the bracket is just Y. 

For calculation in the Gregorian calendar you must note that the orbital period of the Earth around the Sun is not 365 days but closer to 365.2425 days. To account for this longer period, every four years we add an extra day and call the year a leap year. This extra date advances the day along one. So if November 12th is a Monday this year, it would be a Thursday next year (in 2020) which is a leap year. If the leap year is divisible by 100 we skip the leap year, unless it is divisible by 400, in which case we do make it a leap year. This is to account for the fact that simply having a leap year every 4 years would mean a year has 365.25 days and not 365.2425 days. These complex leap year rules are what the last three terms in the equation stand for. For every multiple of 4 years, we advance on one. For every multiple of 100, we subtract one, and for every multiple of 400 we add one back. 

To account for the months, Zeller's idea was to imagine starting a month from March instead of January. So, the number of days in each month would be:
{31,30,31,30,31,31,30,31,30,31,31,28/29}

Calculating the modulo 7 of the number of days would give us: (for non leap years) 
{3,2,3,2,3,3,2,3,2,3,3,0}

If you look closely, they alternate at first, but then there is a double 3, then the sequence repeats. If we look at a graph of their cumulative sums, we get the following chart. For every 5 months advancing, the cumulative count increases by 13. We can approximate this with a line of gradient 13/5, and use the ceiling function to snap to the answer we want.

This accounts for the second term in the formula, we subtract two from the month to shift it back, then multiply by the gradient to get the approximation for the offset, and use the ceiling function to snap it up to the integer.

Using the following mapping, we can now convert the modulos answer to the day of the week.

0 = Saturday
1 = Sunday
2 = Monday
3 = Tuesday
4 = Wednesday
5 = Thursday
6 = Friday

The Zellers formula for Julian Calender is the following. Here, there is no accommodation for the complex leap years, and there is an offset to set the day correctly. 

day = ( d +  $\lceil 13(m - 2) / 5 \rceil$ + Y + $\lfloor Y/4 \rfloor$ + 5) *mod7*

## Python implementation 
```
import math

def zeller(month, day, year):
    day_names =['Saturday','Sunday','Monday','Tuesday','Wednesday','Thursday','Friday']
    if(month < 3):
        month += 12
        year -= 1
    
    day = (day + math.floor(((month+1)*13)/5) + year + math.floor(year/4) - math.floor(year/100) + math.floor(year/400))%7
    return day_names[day] 
	
zeller(11,12,2020)
'Thursday'


```

## Reference
http://datagenetics.com/blog/november12019/index.html
https://calendars.wikia.org/wiki/Zeller%27s_congruence
