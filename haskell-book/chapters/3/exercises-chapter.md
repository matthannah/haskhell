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

2. 
