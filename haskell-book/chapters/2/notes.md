# Notes
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
- :quit is an example of a special command available in GHCi

**Working with source files**
- We want to be able to import our source code for testing into the REPL
- This can be done with the :load command followed by the name of the file; `:load test.hs` for example
- .hs is the Haskell file extension
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
