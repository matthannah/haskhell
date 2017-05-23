# Chapter Exercises
Final chapter exercises, use the REPL to validate answers

## Reading Syntax
1. Decide whether the following syntax is valid for each:

  ```
  concat [[1, 2, 3], [4, 5, 6]] -- Valid
  ++ [1, 2, 3] [4, 5, 6]        -- Invalid; operator ++ is an infix operator, to fix surround by parentheses (++)
  (++) "hello" " world"         -- Valid
  ["hello" ++ " world]          -- Invalid
  4 !! "hello"                  -- Valid
  (!!) "hello" 4                -- Valid
  take "4 lovely"               -- Invalid; take requires 2 arguments, only 1 applied
  take 3 "awesome"              -- Valid
  ```

2. Match the lines of code to the output:

  ```
  a) concat [[1 * 6], [2 * 6], [3 * 6]]
  b) "rain" ++ drop 2 "elbow"
  c) 10 * head [1, 2, 3]
  d) (take 3 "Julie") ++ (tail "yes")
  e) concat [tail [1, 2, 3], tail [4, 5, 6], tail [7, 8, 9]]

  a) "Jules"
  b) [2, 3, 5, 6, 8, 9]
  c) "rainbow"
  d) [6, 12, 18]
  e) 10

  concat [[1 * 6], [2 * 6], [3 * 6]] => [6, 12, 18]
  "rain" ++ drop 2 "elbow" => "rainbow"
  10 * head [1, 2, 3] => 10
  (take 3 "Julie") ++ (tail "yes") => "Jules"
  concat [tail [1, 2, 3], tail [4, 5, 6], tail [7, 8, 9]] => [2, 3, 5, 6, 8, 9]
  ```


## Building Functions
1. Write expressions to perform the following transformations, just with the functions you’ve seen in this chapter

  ```
  a)
    -- Given
    "Curry is awesome"
    -- Return
    "Curry is awesome!"

    concat ["Curry is awesome", "!"]

  b)
    -- Given
    "Curry is awesome!"
    -- Return
    "y"

    **Revised** drop 4 (take 5 "Curry is awesome!") -- This is the best way to do it!
    (!!) "Curry is awesome!" 4 : "" -- Remember that : is the 'cons' operator (consructor)
    [((!!) "Curry is awesome!" 4)] -- Alternatively surround expression in parentheses and []

  c)
    -- Given
    "Curry is awesome!"
    -- Return
    "awesome!"

    drop 9 "Curry is awesome!"
  ```

2. Rewrite each of transformations above as general functions

  ```
  see functionsQ2.hs:

  Prelude> :l functionsQ2
  [1 of 1] Compiling Q2               ( functionsQ2.hs, interpreted )
  Ok, modules loaded: Q2.
  *Q2> addBang "Yo"
  "Yo!"
  *Q2> index4 "Cheese"
  's'
  *Q2> drop9 "Hey dude lol this function"
  "lol this function"
  ```

3. Write a function in source of type `String -> Char` which returns the third `Char` in a `String`

  ```
  see functionsQ3.hs:

  Prelude> :l functionsQ3
  [1 of 1] Compiling Q3               ( functionsQ3.hs, interpreted )
  Ok, modules loaded: Q3.
  *Q3> thirdLetter "hey!"
  'y'
  ```

4. Create a function to return a certain character from the string `"Curry is awesome!"` with an `Int` as in input

  ```
  Prelude> :l functionsQ4
  [1 of 1] Compiling Q4               ( functionsQ4.hs, interpreted )
  Ok, modules loaded: Q4.
  *Q4> letterIndex 5
  ' '
  *Q4> letterIndex 9
  'a'
  *Q4> letterIndex 0
  'C'
  ```

5. Create a function named `rvrs` which uses only `take` and `drop` to take the string `"Curry is awesome!"` and return the string `"awesome is Curry"`

  ```
  Prelude> :l functionsQ5
  [1 of 1] Compiling Q5               ( functionsQ5.hs, interpreted )
  Ok, modules loaded: Q5.
  *Q5> rvrs "Curry is awesome"
  "awesome is Curry"
  ```
