# Notes - Basic Datatypes

## What are types
- Expressions evaluate to values; every value has a type
- Types are a way to group a set of values together that share something in common

## Data declaration
- Data declaration is how datatypes are defined
- The constructor for the type is the name of the type and is capitalised
- Data constructors are the values that inhabit the type they are defined in
- Looking at the type declaration for `Bool`: `data Bool = False | True`
- `data` is the keyword for data declaration; how one introduces new algebraic data types
- `Bool` is the type constructor for the datatype `Bool`; The name of the type and shows up in type signatures
- `False` is data constructor for the value `False`
- `|` indicates logical disjunction ("or"); so a `Bool` is `True` or `False`
- `True` is data constructor for the value `True`
- Not all data declarations will follow this pattern; some may use logical conjunction ("and") and some may even have arguments!
- You can checkout the datatype definitions for types in the REPL with the command `:info`

## Numeric types
- Integral numbers are whole numbers positive and negative
- `Int`: a fixed precision integer; fixed precision meaning that is has a range, with a min and a max, and thus cannot be arbitrarily large or small
- `Integer`: an integer that is not fixed precision; it can be arbitrarily large or small
- Fractional numbers are no integers
- `Float`: single precision floating point numbers; fixed-point number representations have an immutable number of digits assigned for the parts if the number before and after the decimal point. In contrast, floating point numbers can shift how many bits are used to represent numbers before and after the decimal point.
- `Double`: a double precision floating point number type; it has twice as many bits to describe the number compared to float
- `Rational`: a fractional number that represents a ratio of two integers; the value `1/2 :: Rational` will be value carrying two integers representing the numerator `1` and the denominator `2`. `Rational` is arbitrarily precise but not as efficient as `Scientific`
- `Scientific`: a space efficient and almost arbitrary precision scientific number type; represented in scientific notation (such as 1.23x10^6), it stores the coefficient as an `Integer` and the exponent as an `Int`
- All of these numeric datatypes  all have instances of a typeclass called `Num`
- Typeclasses add functionality to types; for instance the operators `(+)`, `(-)`, and `(*)` are available in the `Num` typeclass as well as other functions
- You can find out the minimum and maximum bounds of numeric types using `minBound` and `maxBound` respectively

## Comparing Values
- We can compare values to determine whether they are equal (`==`), not equal (`/=`), greater than (`>`), greater than or equal (`>=`), less than (`<`), less than or equal (`<=`)
- Looking at the types for `<` and `==` we see that they have typeclass constraints:
```
Prelude> :t (==)
(==) :: Eq a => a -> a -> Bool
Prelude> :t (<)
(<) :: Ord a => a -> a -> Bool
```
- `Eq` is a typeclass that includes everything that can be compared and determined to be equal in value
- `Ord` is a typeclass that includes all things that can be ordered
- Notice the `a`, this means than it doesn't matter what type you give it, as long as it adheres to the typeclass constraints it can be operated on: `Integers`, `Strings` etc; thus they are polymorphic.
- We can even use the comparisons on lists of values, as long as the items in the list are instances of the specific typeclass the operator requires; `[1, 2] == [1, 2] > True`
