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
  Woot is not a type, instead it is a value of the type Mood
  the type signature should instead look like:

  changeMood :: Mood -> Mood
  ```
