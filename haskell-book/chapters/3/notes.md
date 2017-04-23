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

## Printing simple Strings
```
Prelude> print "hello world!"
"hello world!"
```
- The print command tells the REPL to print the string to the display
- Some other printing commands which have slightly different results:
```
Prelude> putStrLn "hello world!"
hello world!
Prelude>
Prelude> putStr "hello world!"
hello world!Prelude>
```
- Using `print1.hs` which prints in source code;
```
Prelude> :l print1
[1 of 1] Compiling Print1           ( print1.hs, interpreted )
Ok, modules loaded: Print1.
*Print1> main
hello world!
```
