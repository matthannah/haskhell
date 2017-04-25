# Learning Exercises
Exercises that come out throughout the chapter

## Scope
1. REPL: Is `y` in scope for `z`?

  ```
  Prelude> let x = 5
  Prelude> let y = 7
  Prelude> let z = x * y

  y is in scope for the z definition
  ```

2. REPL: Is `h` in scope for function `g`?

  ```
  Prelude> let f = 3
  Prelude> let g = 6 * f + h

  h is not defined thus it is not in scope
  ```

3. Source: Is everything we need to execute in `area` in scope?

  ```
  area d = pi * (r * r)
  r = d / 2

  variable d is not in scope for r, thus area cannot be executed
  ```

4. Source: Are `r` and `d` in scope for `area`?

  ```
  area d = pi * (r * r)
    where r = d / 2

  Yes, r is defined within area's scope thus d in r is bound to the argument passed in area
  ```

## Syntax Errors
Decide whether the following will compile:
1. `++ [1, 2, 3] [4, 5, 6]`

  ```
  This won't compile since ++ is an infix operator, we could fix the above by surrounding in parentheses to change it to a prefix operator:

  (++) [1, 2, 3] [4, 5, 6]
  ```

2. `'<3' ++ ' Haskell'`

  ```
  This won't compile since strings need to be type aliased with double quotes instead of single quotes, the fix would be:

  "<3" ++ " Haskell"
  Remember that "dsa" creates a List of characters - String
  ```

3. `concat ["<3", " Haskell"]`

  ```
  This will compile, since we meet the type definitions requirements of an input being a list of lists of type a, in our case a list of strings, where a string is a list of Char:

  [[Char]] -> [Char] fits the shape of [[a]] -> [a]
  ```
