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
