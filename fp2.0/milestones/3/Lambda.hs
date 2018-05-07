{-# OPTIONS_GHC -Wall #-}
module Lambda where

type Var = String

data Expr = Lambda Var Expr | Lit Var | Application Expr Expr

instance Show Expr where
    show (Lambda x y) = "λ" ++ x ++ "." ++ show y
    show (Lit x) = x
    show (Application x y) = "(" ++ show x ++ ")(" ++ show y ++ ")"

-- Perform one step of beta reduction
eval :: Expr -> Expr
eval (Application l@(Lambda h b) r) = (substitute b h (rename r l))
-- before we dive straight in to pattern matching there's something we should do first regardless of what l and r is ?? FIGURE IT OUT!!!!
eval e = e

-- Rename an expression so that we have no issues with substitution binding variables
-- Expression to rename -> Expression to rename against -> Renamed expression
rename :: Expr -> Expr -> Expr
rename = undefined

-- Finds free variables in an expression
freeVariables :: Expr -> [Var]
freeVariables = undefined

-- Expression to sub things into -> Substitute all cases of Var -> Thing to substitute -> Substituted Expression
substitute :: Expr -> Var -> Expr -> Expr
substitute e@(Lit v) i r
    | i == v = r
    | otherwise = e
substitute (Lambda h b) i r = (Lambda h (substitute b i r))
substitute (Application e1 e2) i r = (Application (substitute e1 i r) (substitute e2 i r))

-- type Parser a = String -> Either String (a, String)
-- return either an error, or the parsed thing, and the rest of the string to parse
-- parse by making repeated calls to parse
