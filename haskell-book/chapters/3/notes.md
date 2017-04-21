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
