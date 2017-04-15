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
