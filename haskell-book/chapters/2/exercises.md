# Exercises

## Comprehension Check
1. How would we change the following lines of code so that they are usable in the GHCi (REPL)? `half x = x / 2` and `square x = x * x`:
```
# Use the let keyword
let half x = x / 2
square x = x * x
```

2. Write a function that can accept one argument and work for all the following expressions:
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
