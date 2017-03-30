# Notes
**Functional Programming**
- Programs are a combination of expressions
- Expressions include concrete values, variables and functions
- Functions are expressions that are applied to an input
- First class functions can be used as values or passed as arguments
- Purity or Referential Transparency, means that the same function given the same input will always return the same result
- Understanding that functions are a mapping of a set of inputs to outputs is crucial

**Lambda Calculus**
- Lambda calculus has three basic terms; expressions variables and abstractions
- Expressions can be a variable name, and abstraction, or a combination of these
- Variables are just names for potential inputs to a function
- Abstractions are functions; a lambda term that has a head and a body which are applied to an argument
- An argument is an input for a function
- The head of the abstraction includes a lambda symbol followed by arguments
- The body is another expression

**Alpha Equivalence**
- Variable names are not semantically meaningful
- Alpha equivalence is a way of saying that λx.x means the same as λy.y

**Beta Reduction**
- Applying a lambda term to an argument
- Beta reduction stops when there are either no more lambda heads left to apply, or no more arguments to apply functions to
- When beta reduction is no longer possible, the form of the lambda is called the beta normal form

**Free Variables**
- Variables that are not bound in a lambda expression
- Basically, variables that are not named in the head: λx.xy (y is a free variable)

**Multiple Arguments**
- Each lambda can only bind one parameter and can only accept one argument
- Functions that require multiple arguments have multiple nested heads
- λxy.xy is shorthand for λx.(λy.xy) - this is called currying

**Combinators**
- Lambda terms with no free variables

**Divergence**
- When a lamda term never reduces, it is known as Divergence
- (λx.xx)(λx.xx) is an example of a diverging lambda term
