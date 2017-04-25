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
