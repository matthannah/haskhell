{-# LANGUAGE FlexibleInstances #-}

import ExprT
import qualified StackVM
import VarExprT
import Parser (parseExp)
import qualified Data.Map as M

eval :: ExprT -> Integer
eval (Add e1 e2) = (eval e1) + (eval e2)
eval (Mul e1 e2) = (eval e1) * (eval e2)
eval (Lit v) = v

evalStr :: String -> Maybe Integer
evalStr s = case (parseExp Lit Add Mul s) of
  Just e -> Just (eval e)
  Nothing -> Nothing

testExp :: Expr a => Maybe a
testExp = parseExp lit add mul "(3 * -4) + 5"

testInteger = testExp :: Maybe Integer
testBool = testExp :: Maybe Bool
testMM = testExp :: Maybe MinMax
testSat = testExp :: Maybe Mod7

class Expr a where
  lit :: Integer -> a
  add :: a -> a -> a
  mul :: a -> a -> a

instance Expr ExprT where
  lit = Lit
  add = Add
  mul = Mul

instance Expr Integer where
  lit = id
  add = (+)
  mul = (*)

instance Expr Bool where
  lit = (>0)
  add = (||)
  mul = (&&)

instance Expr MinMax where
  lit = MinMax
  add (MinMax v1) (MinMax v2) = MinMax (max v1 v2)
  mul (MinMax v1) (MinMax v2) = MinMax (min v1 v2)

instance Expr Mod7 where
  lit = Mod7 . (`mod` 7)
  add (Mod7 v1) (Mod7 v2) = Mod7 ((v1 + v2) `mod` 7)
  mul (Mod7 v1) (Mod7 v2) = Mod7 ((v1 * v2) `mod` 7)

instance Expr Program where
  lit v = [PushI v]
  add p1 p2 = (p1 ++ p2) ++ [StackVM.Add]
  mul p1 p2 = (p1 ++ p2) ++ [StackVM.Mul]

newtype MinMax = MinMax Integer deriving (Eq, Show)
newtype Mod7 = Mod7 Integer deriving (Eq, Show)

class HasVars a where
  var :: String -> a

instance Expr VarExprT where
  lit = VarExprT.Lit
  add = VarExprT.Add
  mul = VarExprT.Mul

instance HasVars VarExprT where
  var = Var

instance HasVars (M.Map String Integer -> Maybe Integer)

instance Expr (M.Map String Integer -> Maybe Integer)
