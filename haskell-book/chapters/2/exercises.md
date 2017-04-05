# Exercises

## Comprehension Check
1. How would we change the following lines of code so that they are usable in the GHCi (REPL)? `half x = x / 2` and `square x = x * x`
```
# Use the let keyword
let half x = x / 2
let square x = x * x
```

2. Write a function that can accept one argument and work for all the following expressions
```
3.14 * (5 * 5)
3.14 * (10 * 10)
3.14 * (2 * 2)
3.14 * (4 * 4)

squareAndMultiplyByPi x = 3.14 * (x * x)
```
3. There is a value in Prelude called pi; use this in the function written above
```
squareAndMultiplyByPi x = pi * (x * x)
```

## Parentheses and Association
Decide whether the added parentheses from a) to b) change the results of the function
1. a) `8 + 7 * 9` b) `(8 + 7) * 9`
```
The parentheses change the result:
a) 7 * 9 is evaluated first 
b) 8 + 7 is evaluated first
```
2. a) `perimeter x y = (x * 2) + (y * 2)` b) `perimeter x y = x * 2 + y * 2`
```
The parentheses do not change the result since * is evaluated first
```
3. a) `f x = x / 2 + 9` b) `f x = x / (2 + 9)`
```
The parentheses change the result:
a) x / 2 is evaluated first
b) 2 + 9 is evaluated first
```
