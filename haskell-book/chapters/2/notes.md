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

**Defining Functions**
- A Function definition starts with the name of the function
- The name is followed by the formal parameters (arguments) of the function, seperated by white space
- Next is the equal sign character, which expresses equality of the terms
- Finally there is an expression that is the body of the function and can be evaluated to return a values
- An example function definition; `triple x = x * 3`
- Defining functions in GHCi (REPL) we use the let keyword; `let triple x = x * 3`
- Function names should be camelCase

**Evaluation**
