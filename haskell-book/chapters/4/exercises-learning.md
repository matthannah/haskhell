# Learning Exercises
Exercises that come out throughout the chapter

## Mood Swing
Answer the following questions for the datatype `data Mood = Blah | Woot deriving Show`
Note that the `deriving Show` allows values of that type to be printed to the screen, it'll be explained later in typeclasses

1. What is the type constructor, or name of this type?

  ```
  Mood
  ```

2. If a function requires a `Mood` value what are the values you could possible use?

  ```
  Blah or Woot
  ```

3. If we are writing a function `changeMood`, it should act like `not` in that it should return the other value of the same type it's given, what's wrong with the type signature `changeMood :: Mood -> Woot` in this context?

  ```
  Woot is not a type, instead it is a value of the type Mood, type signatures should declare only types; the type signature should instead look like:

  changeMood :: Mood -> Mood
  ```

  4. Now we want to write the changeMood function, fix any mistakes and complete the function.
  Note that in the function we are `pattern matching`; defining a function by matching on a data constructor, or value, and describing the behaviour the should have based on which value it matches. The `_` denotes catch all

    ```
    changeMood Mood = Woot
    changeMood _ = Blah

    Solution:
    changeMood :: Mood -> Mood
    changeMood Woot = Blah
    changeMood Blah = Woot
    ```

5. Implement `changeMood` in a source file and make sure it works in the REPL

  ```
  See change-mood.hs:

  Prelude> :l change-mood
  [1 of 1] Compiling ChangeMood       ( change-mood.hs, interpreted )
  Ok, modules loaded: ChangeMood.
  *ChangeMood> changeMood Blah
  Woot
  *ChangeMood> changeMood Woot
  Blah
  ```

## Find the mistakes
Some of these lines of code won't compile, identify ones that won't and fix them
1. `not True && True`

  ```
  not True && True -- There is nothing wrong with this expression
  ```

2. `not (x = 6)`

  ```
  
  ```

3. `(1 * 2) > 5`

4. `[Merry] > [Happy]`

5. `[1, 2, 3] ++ "look at me!"`
