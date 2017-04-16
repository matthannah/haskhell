# Chapter Exercises
Final chapter exercises, use the REPL to validate answers

## Parenthesization
Parenthesize the following expressions to make them more explicit without changing the result:
1. `2 + 2 * 3 - 1` -> `2 + (2 * 3) - 1`
2. `(^) 10 $ 1 + 1` -> `(10^) $ 1 + 1` or `10 ^ (1 + 1)`
3. `2 ^ 2 * 4 ^ 5 + 1` -> `((2 ^ 2) * (4 ^ 5)) + 1`

## Equivalent Expressions
Which of the following pairs of expressions will return the same result when evaluated?
1. `1 + 1` and `2`

  ```
  -- Same
  1 + 1 = 2
  2     = 2
  ```

2. `10 ^ 2` and `10 + 9 * 10`

  ```
  -- Same
  10 ^ 2 = 10 * 10 = 100
  10 + 9 * 10 = 10 + 90 = 100
  ```

3. `400 - 37` and `(-) 37 400`

  ```
  -- Not the same: Arguments are in different order
  400 - 37 = 363
  (-) 37 400 = 37 - 400 = -363
  ```

4. ``100 `div` 3`` and `100 / 3`

  ```
  -- Not the same: Fractional division (/) is different to Integral division (div)
  100 `div` 3 = 33
  100 / 3 = 33.33333
  ```

5. `2 * 5 + 18` and `2 * (5 + 18)`

  ```
  -- Not the same: Due to parentheses changing precedence
  2 * 5 + 18 = 10 + 18 = 28
  2 * (5 + 18) = 2 * 23 = 46
  ```

## Functions
Enter the following code into the REPL, in the correct order, so that is can be evaluated:
```
z = 7
x = y ^ 2
waxOn = x * 5
y = z + 8
```
Entered into the REPL:
```
Prelude> z = 7
Prelude> y = z + 8
Prelude> x = y ^ 2
Prelude> waxOn = x * 5
```
Now that waxOn is a value in the REPL, what do you think the results of each of the following will be? Include workings. Remember to validate your answers with the REPL
1. `10 + waxOn`

  ```
  result = 10 + waxOn
  result = 10 + (x * 5) -- sub in waxOn
  result = 10 + ((y ^ 2) * 5) -- sub in x
  result = 10 + (((z + 8) ^ 2) * 5) -- sub in y
  result = 10 + (((7 + 8) ^ 2) * 5) -- sub in z
  result = 10 + (((15) ^ 2) * 5) -- solve
  result = 10 + ((225) * 5) -- solve
  result = 10 + (1125) -- solve
  result = 1135
  ```

2. `(+10) waxOn`

  ```
  result = (+10) waxOn
  result = (+10) x * 5 -- sub in waxOn
  result = (+10) (y ^ 2) * 5 -- sub in x
  result = (+10) ((z + 8) ^ 2) * 5 -- sub in y
  result = (+10) ((7 + 8) ^ 2) * 5 -- sub in z
  result = (+10) ((15) ^ 2) * 5 -- solve
  result = (+10) (225) * 5 -- solve
  result = (+10) 1125 -- solve
  result = 10 + 1125
  result = 1135
  ```

3. `(-) 15 waxOn`

  ```
  result = (-) 15 waxOn
  result = (-) 15 (x * 5) -- sub in waxOn
  result = (-) 15 ((y ^ 2) * 5) -- sub in x
  result = (-) 15 (((z + 8) ^ 2) * 5) -- sub in y
  result = (-) 15 (((7 + 8) ^ 2) * 5) -- sub in z
  result = (-) 15 (((15) ^ 2) * 5) -- solve
  result = (-) 15 ((225) * 5) -- solve
  result = (-) 15 1125 -- solve
  result = 15 - 1125
  result = -1110
  ```

4. `(-) waxOn 15`

  ```
  result = (-) waxOn 15
  result = (-) (x * 5) 15 -- sub in waxOn
  result = (-) ((y ^ 2) * 5) 15 -- sub in x
  result = (-) (((z + 8) ^ 2) * 5) 15 -- sub in y
  result = (-) (((7 + 8) ^ 2) * 5) 15 -- sub in z
  result = (-) (((15) ^ 2) * 5) 15 -- solve
  result = (-) ((225) * 5) 15 -- solve
  result = (-) 1125 15 -- solve
  result = 1125 - 15
  result = 1110
  ```
