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
