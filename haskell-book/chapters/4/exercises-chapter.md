# Chapter Exercises
The following questions require `awesome`, `alsoAWesome` and `allAwesome` be in scope for the REPL session:
```
awesome = ["Papuchon", "curry", ":)"]
alsoAwesome = ["Quake", "The Simons"]
allAwesome = [awesome, alsoAwesome]
```
`length` is a function that takes a list and returns a result that tells how many items are in the list

1. Given the definition of `length` above, write the type signature

2. What are the results of the following expressions?

  ```
  length [1, 2, 3, 4, 5]

  length [(1, 2), (2, 3), (3, 4)]

  length allAwesome

  length (concat allAwesome)
  ```

3. Given that we know about numeric types and the type signature of `length`, look at these two expressions. One works and one returns an error. Determine which one works and which returns the error. **Note** You will find `Foldable t => t a` representing `[a]`, as with `concat` in the previous chapter. Again, consider `Foldable t` to represent a list here, even though list is only one of the possible types

  ```
  6 / 3

  6 / length [1, 2, 3]
  ```

4. How can you fix broken code from the preceding exercise using a different division function?

  ```

  ```

5. What is the type of the expression `2 + 3 == 5`? What would we expect as a result?

  ```

  ```

6. What is the type and expected result value of the following

  ```
  x = 5
  x + 3 == 5
  ```

7. Below are some bits of code, which will work and why? What value would they reduce to if they work?

  ```
  length allAwesome == 2

  length [1, 'a', 3, 'b']

  length allAwesome + length awesome

  (8 == 8) && ('b' < 'a')

  (8 == 8) && 9
  ```

8. Write a function that tells you whether or not a given String is a palindrome. **Note** you will want to use a function called `reverse`

  ```
  isPalindrome :: (Eq a) => [a] -> Bool
  ```

9. Write a function to return the absolute value of a number using `if-then-else`

  ```
  myAbs :: Integer => Integer
  ```

10. Fill in the definition of the following function using `fst` and `snd`

  ```
  f :: (a,b) => (c,d) => ((b,d), (a,c))
  ```
