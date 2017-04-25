# Notes - Strings
## Introduction to Types
- Types are a way to categorize values
- Easiest way to find out the type of a value is using the `:type` command in the REPL:
```
Prelude> :type 'a'
'a' :: Char
```
- `a` is in single quotes so that GHCi knows it's a character and not a variable
- the `::` symbol is read as "has the type"; this will come up a lot in Haskell, and lets you know you're looking at a type signature
- `Char` is the type, which can include unicode characters, alphabetical characters, symbols etc
```
Prelude> :type "Hello!"
"Hello!" :: [Char]
```
- `"Hello!"` is in double quotes so GHCi knows it's a string
- String is a type alias for list of Char
- the `[]` is syntactic sugar for a list

## Main
- `main` is the default action when you build an executable or run it in a REPL
- It is not a function, but a series of instructions to execute, which can include applying functions and producing side-effects
- When building a project in stack, having the `main` executable in a file called `Main.hs` is obligatory
- remember you can have source files and load them in the REPL without necessarily having a `main` block

## IO
- In a lot of source you will see, `main` has the type `IO ()`
- `IO` stands for input/output, but has a special meaning in Haskell; running the program involves effects in addition to being a function or expression
- Printing to the screen is an example of an effect, so programs that print screens will need a `main` that has type `IO ()`
- Note that in the REPL, GHCi implicitly understands and implements `IO`; since it's a (R)ead (E)val (P)RINT (L)oop :)

## Printing simple Strings
- The print command tells the REPL to print the string to the display:
```
Prelude> print "hello world!"
"hello world!"
```
- Some other printing commands which have slightly different results:
```
Prelude> putStrLn "hello world!"
hello world!
Prelude>
Prelude> putStr "hello world!"
hello world!Prelude>
```
- We can print from source too as long as `main` has the type `IO ()`. Checkout the `print1.hs` source:
```
Prelude> :l print1
[1 of 1] Compiling Print1           ( print1.hs, interpreted )
Ok, modules loaded: Print1.
*Print1> main
hello world!
```
- Another source file `print2.hs`:
```
Prelude> :l print2
[1 of 1] Compiling Print2           ( print2.hs, interpreted )
Ok, modules loaded: Print2.
*Print2> main
Count to four for me:
one, two, three, and four!
```
- Note that `print2.hs` main block uses the `do` syntax, which allows for sequencing actions (more on this in later chapters!)

## String Concatenation
- Concatenation means to link together, in the context of strings, it means joining two together to form a single string
- To concat strings we can use the `++` operator or the `concat` function
- Checkout the `print3.hs` source for some examples:
```
Prelude> :l print3
[1 of 1] Compiling Print3           ( print3.hs, interpreted )
Ok, modules loaded: Print3.
*Print3> main
hello world!
hello world!
```

## Top-level versus local definitions
- When a compiler reads the file, it sees all the top level declarations no matter what order they are in
- Top level declarations are not nested in anything else; they are in scope throughout the whole module
- Local declarations are nested in some expression, and are not visible to outside that expression

## Types of Concatenation functions
- Taking a look at the types of `(++)` and `concat` using `:t` command in prelude:
```
Prelude> :t (++)
(++) :: [a] -> [a] -> [a]
Prelude> :t concat
concat :: [[a]] -> [a]
```
- The type of `concat` says we can have a list of lists of type `a` and it will return a list of type `a`
- The type of `(++)` says we can have a list of type `a` and a list of type `a` as inputs and it will return a list of type `a`
- The type variable `a` in `[a]` is polymorphic. It can be any type, so for a string in `concat` we would have: `[[Char]] -> [Char]`
- To read the `:t` output easier we can break it down:
```
(++) :: [a] -> [a] -> [a]
(++) - this is the function name
::   - this means 'has the type', anything after this is about type definition
[a]  - take an argument of type [a], which is a list of elements of type a, the function doesn't know what the type of a is, and it doesn't need to know
[a]  - take another argument of type [a]
[a]  - return a result of type [a]
```
- As you can see the type `a` must be kept constant, thus the following expression won't work: `concat [[1, 2, 3], ["hello"]]`, since we have `Num` and `Char` types
