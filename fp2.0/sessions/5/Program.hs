import ExprT
import Parser (parseExp)
import StackVM

compile :: String -> Maybe Program
compile s = parseExp lit add mul s :: Maybe Program
