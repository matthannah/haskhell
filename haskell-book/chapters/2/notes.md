# Notes - Hello, Haskell
## Development Environment
**Stack**
- Program for developing Haskell projects
- See http://docs.haskellstack.org/en/stable/README/

**GHCi**
- Interactive environment (REPL) for running Haskell code
- Once stack is installed, run the command `stack ghci` in a shell to open up the REPL
- If the REPL is open, you should see `Prelude>`

**Prelude**
- A library of standard functions, which stack ghci automatically loads
- You can turn prelude off, or use alternative preludes

**GHCi commands**
- Special commands start with the colon character `:`
- These commands are not Haskell code, rather a way to interact with the REPL
- `:quit` is an example of a special command available in GHCi

**Working with source files**
- We want to be able to import our source code for testing into the REPL
- This can be done with the `:load` command followed by the name of the file; `:load test.hs` for example
- `.hs` is the Haskell file extension
- When the module is loaded run `sayHello "Haskell"` to interact with it
- Note that the `Prelude>` prompt has changed, to return, use the command `:module`

## Haskell Code
- A lot of this will sound like lambda calculus! Duhhh

**Expressions**
- Everything in Haskell is an expression or declaration
- Expressions can be values, combination of values, and/or functions applied to values.
- Expressions evaluate to a result
- Expressions are the building blocks of Haskell programs; a program is one big expression made of smaller ones
- An expression is in normal form when there are no more evaluation steps that can be taken
- The expression `1 + 1` can be evaluated to `2`, `2` can no longer be evaluated because it can't be evaluated into anything but itself

**Functions**
- Functions are a specific type of expression
- They map inputs to outputs
- A function is an expression that is applied to an argument and always returns a result
- Because they are built purely of expressions they will always evaluate to the same result when given the same values
- As in lambda calculus a function only takes one argument and returns one result
- When it seems we are using multiple arguments, it's actually applying a series of nested functions, each to one argument; *currying*
- Functions default to prefix syntax; the function being applied is at the beginning of an expression

**Defining Functions**
- A Function definition starts with the name of the function
- The name is followed by the formal parameters (arguments) of the function, seperated by white space
- Next is the equal sign character, which expresses equality of the terms
- Finally there is an expression that is the body of the function and can be evaluated to return a values
- An example function definition; `triple x = x * 3`
- Defining functions in GHCi (REPL) we use the let keyword; `let triple x = x * 3`
- Function names should be camelCase

**Evaluation**
- Evaluating an expression; reducing terms until the expression reaches the simplest form.
- Once a term has reached its simplest form, we call it a value
- Haskell has non-strict evaluation (lazy evaluation); evaluation is defered until other terms refer to them
- Values are irreducible, but applications of functions to arguments are reducible
- Reducing an expression means evaluating the terms until you're left with a value
- Values are the terminal point of reduction
- As in lambda calculus, application is evaluation
- Haskell doesn't evaluate everything to normal form by default; it only evaluates to weak head normal form (more on this later)
- Non-strict evaluation means that not everything will get reduced to its normal form; `(\f -> (1, 2 + f)) 2` reduces to the weak head normal form `(1, 2 + 2)`. This representation is an approximation; the key point being `2 + 2` is not reduced until the last possible moment

**Infix Operators**
- Functions in Haskell default to either prefix or infix operators
- An example of an infix operator is `+` in `1 + 1` and an example of a prefix operator is `triple` in `triple 3`
- Functions that have an alphanumeric name default to prefix
- Functions that have a symbol as a name default to infix
- You can sometimes use prefix functions as infix by using the syntax ``2 `div` 4`` compared to prefix `div 2 4`
- Not all prefix functions can be used as infix
- You can also use infix operators as prefix when you surround them with parentheses; `(+) 1 1` is the same as `1 + 1`

**Associativity and Precedence**
- As in math, there's a default associativity and precedence to the infix operators `+ * / -`
- The special command :info will tell you about a functions type information, whether it's an infix operator, and its associativity and precedence
- Entering the command `:info (*)` will output the following in Prelude: `infixl 7 *`.. try it!
- `infixl` means it's an infix operator and is left associative
- `7` is its precedence; the higher precedence operators are applied first (on a scale of 0-9)
- `*` is the infix function name, in this case multiplication
- intuition about precedence in maths generally hold in Haskell
- remember! associativity of an operator is a property that determines how operators of the same precedence are grouped in the absence of parentheses.

**Left vs Right associativity**
- this `2 * 3 * 4` is evaluated as if it was this `(2 * 3) * 4` because of * being left associative
- this `2 ^ 3 ^ 4` is evaluated as if it was this `2 ^ (3 ^ 4)` because of ^ being right associative
- we can manually add in parentheses to change results; `(2 ^ 3) ^ 4` will evaluate `2 ^ 3` first; just like maths!

**Declaring Values**
- The order of declarations in source code don't matter, because the file is loaded in its entirety at once
- However it does matter in the REPL, since things are evaluated per loop
- In the REPL we can declare a value like so: `let y = 10`, `let x = 10 * 5 + y`, `let myResult = x * 5`; typing the names of the values and hitting enter will return the value
- Take a look at the file learn.hs for an example of doing the same declarations
- Note that module names start with a capital letter! more on this later ;)
- An example of loading the module learn.hs;
```
Prelude> :load learn.hs
[1 of 1] Compiling Learn            ( learn.hs, interpreted )
Ok, modules loaded: Learn.
*Learn> x
60
*Learn> y
10
*Learn> myResult
300
*Learn> :module
Prelude>
```

**Troubleshooting**
- Incorrect indentation of code can break your code; can change the meaning of the code
- REMEMBER: Use spaces not tabs!
- Whitespace is significant; it is the only mark of a function call; `triple 3`
- Trailing white space is considered bad style!
- In source code files, indentation replaces syntatic markers like curly braces, semicolons and parentheses
- Basic rule; code that is part of an expression should be indented under the beginning of that expression, even when the expression is not at the leftmost margin
- Parts of the expression that are grouped should be indented at the same level
- Pay careful attention to indentation markers
- Checkout the exercises for `Heal the Sick` for common troubleshooting examples

**Arithmetic Functions**

| Operator | Name      | Purpose                                |
| ---------|-----------| ---------------------------------------|
| +        | plus      | addition                               |
| -        | minus     | subtraction                            |
| *        | asterisk  | multiplication                         |
| /        | slash     | fractional division                    |
| div      | divide    | integral division, round down          |
| mod      | modulo    | like 'rem', but after modular division |
| quot     | quotient  | integral division, round towards zero  |
| rem      | remainder | remainder after division               |

- Examples of each in the REPL:
```
Prelude> 21 + 4
25
Prelude> 45 - 21
24
Prelude> 32 * (-2) # Note brackets around negatives
-64
Prelude> 4 / 3
1.3333333333333333
Prelude> div 20 6
3
Prelude> quot 20 6
3
Prelude> div 20 (-6) # Rounds down
-4
Prelude> quot 20 (-6) # Rounds towards zero
-3
Prelude> mod 21 2
1
Prelude> mod 21 (-2)
-1
Prelude> rem 21 2
1
Prelude> rem 21 (-2)
1

```

**Laws for quotients and remainders**
- `(quot x y) * y + (rem x y) == x`
-  `(div x y) * y + (mod x y) == x`

**Using mod**
- mod gives the remainder of a modular division
- modular arithmetic is a system of arithmetic for integers where numbers "wrap around" upon reaching a certain value, called the modulus
- You can think of this as an analogy of a clock; `mod 8 12` is + 8 hours starting from zero around a 12 hour clock, so the evaluated result will be `8`. `mod 14 12` is + 14 hours starting from zero, so we wrap around past the 12, and land on 2, thus the evaluated result is `2`
- This is arithmetic modulo 12. It should be noted that 12 is equivalent to 0
- Lets write a function to determine the day of the week, assigning weekdays a number with Sunday as zero:
```
Prelude> mod (1 + 23) 7 -- 1 is the current day (Monday), 23 is the number of days we are adding, and wrap around 7
3 # Wednesday
Prelude> rem (1 + 23) 7 -- We can use rem too with apparent equivalent accuracy
3
Prelude> mod (3 - 12) 7 -- If we want to subtract we will see a difference between the two
5
Prelude> rem (3 - 12) 7 -- The version with mod gave a correct answer, while rem did not!
-2
```
- As seen from the example, the negative is handled differently between mod and rem in Haskell (this is not the same in all languages)
- If one or both arguments are negative; mod results will have the same sign as the divisor (bottom part in a division; the `3` in `1/3`)
- The result of rem will have the same sign as the dividend (the top part in a division; the `1` in `1/3`)
- The behaviours can be seen below:
```
-- mod
Prelude> (-7) `mod` 2
1
Prelude> 7 `mod` (-2)
-1
Prelude> (-7) `mod` (-2)
-1

-- rem
Prelude> (-7) `rem` 2
-1
Prelude> 7 `rem` (-2)
1
Prelude> (-7) `rem` (-2)
-1
```

**Negative Numbers**
- If you want a value that is a negative number we can do this:
```
Prelude> -10
-10
```
- However, this won't work:
```
Prelude> 5 + -10
<interactive>:3:1:
    Precedence parsing error
        cannot mix ‘+’ [infixl 6] and
        prefix `-` [infixl 6]
           in the same infix expression
```
- Note how the error message lets us know it is to do with precedence; it thinks we are trying to add and subtract, not add a negative number
- Introducing parentheses allows the expression to be evaluated:
```
Prelude> 5 + (-10)
-5
```
- The negation of numbers by the use of unary `-` in `-10` is a form of syntactic sugar for `negate 10`
- Note that syntactic sugar simply makes code easier to read and write, there is no semantic difference. The two expressions are semantically identical:
```
Prelude> 10 + (-5)
5
Prelude> 10 + (negate 5)
5
```
- and here `-` is being used for subtraction:
```
Prelude> 10 - 5
5
```

**($) Operator**
- This operator causes everything to the right of it to be evaluated first
- It's a convenience for when you want to express something with fewer parentheses
- You can use multiple `$` operators in the same expression
- Here's some examples straight from the book:
```
Prelude> (2^)(2+2)
16
Prelude> (2^) $ 2 + 2 -- With $ operator
16
Prelude> (2^) 2 + 2 -- Without parentheses or $ operator
6
Prelude> (2^) $ (+2) $ 3 * 2 -- Two $ operators
256
Prelude> (2^) $ 2 + 2 $ (*30) -- This gives a large error (seen below)

<interactive>:9:2: error:
    * Could not deduce (Integral b0) arising from an operator section
      from the context: Num a
        bound by the inferred type of it :: Num a => a
        at <interactive>:9:1-20
      The type variable `b0' is ambiguous
      These potential instances exist:
        instance Integral Integer -- Defined in `GHC.Real'
        instance Integral Int -- Defined in `GHC.Real'
        instance Integral Word -- Defined in `GHC.Real'
    * In the expression: (2 ^)
      In the expression: (2 ^) $ 2 + 2 $ (* 30)
      In an equation for `it': it = (2 ^) $ 2 + 2 $ (* 30)

<interactive>:9:8: error:
    * Could not deduce (Num ((a0 -> a0) -> b0))
        arising from a use of `+'
        (maybe you haven't applied a function to enough arguments?)
      from the context: Num a
        bound by the inferred type of it :: Num a => a
        at <interactive>:9:1-20
      The type variables `b0', `a0' are ambiguous
    * In the expression: 2 + 2
      In the second argument of `($)', namely `2 + 2 $ (* 30)'
      In the expression: (2 ^) $ 2 + 2 $ (* 30)

<interactive>:9:17: error:
    * Could not deduce (Num a0) arising from an operator section
      from the context: Num a
        bound by the inferred type of it :: Num a => a
        at <interactive>:9:1-20
      The type variable `a0' is ambiguous
      These potential instances exist:
        instance Num Integer -- Defined in `GHC.Num'
        instance Num Double -- Defined in `GHC.Float'
        instance Num Float -- Defined in `GHC.Float'
        ...plus two others
        ...plus one instance involving out-of-scope types
        (use -fprint-potential-instances to see them all)
    * In the second argument of `($)', namely `(* 30)'
      In the second argument of `($)', namely `2 + 2 $ (* 30)'
      In the expression: (2 ^) $ 2 + 2 $ (* 30)
```
- We can see why the last example errors with reduction:
```
(2^) $ 2 + 2 $ (*30)
-- Given the right-associativity (infixr) of $
-- we must begin at the right-most position.
2 + 2 $ (*30)
-- reduce ($)
(2 + 2) (*30)
-- then we must evaluate (2 + 2) before we can apply it
4 (*30)
-- This doesn't make sense! We can't apply 4
-- as if it was a function to the argument (*30)!
```
- Flipping the expression around we can see that this now works:
```
(2^) $ (*30) $ 2 + 2
-- must evaluate right-side first
(2^) $ (*30) $ 2 + 2
-- application of the function (*30) to the
-- expression (2 + 2) forces evaluation
(2^) $ (*30) 4
-- then we reduce (*30) 4
(2^) $ 120
-- reduce ($) again.
(2^) 120
-- reduce (2^)
1329227995784915872903807060280344576
```
- The $ operator is too common to not be familiar with, even if parentheses are easier to read

**Parenthesizing infix operators**
- There are times when you want to refer to an infix function without applying any arguments, as well as times when you want to use them as prefix operators
- We learnt previously that to do this, we must wrap the operator in parentheses; `(+) 2 2`
- So `(+)` is the addition infix function without any arguments applied yet and `(+1)` is the addition infix function with one argument applied `1`
- The syntax `(+1)` is known as sectioning, which allows you to pass around partially applied functions
- It doesn't matter if you write `(+1)` or `(1+)`, because the order of the arguments won't change the result
- Remember that this won't work; `(-1) 2` because the `-` operator is acting as negation! However, this will work; `(1-) 2`

**Let and Where**
- `let` introduces an expression, so it can be used wherever you can have an expression
- `where` is a declaration and is bound to a surrounding syntactic construct
- Example of `where`:
```
printInc x = print plusFive
  where plusFive = x + 5

-- Using printInc:
printInc 2
7
```
- Example of `let`:
```
printInc x = let plusFive = x + 5
             in print plusFive

-- Using printInc:
printInc 5
10
```
