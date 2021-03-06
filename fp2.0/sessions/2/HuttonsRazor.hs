data Expr
       = Lit Integer
       | Add Expr Expr

eval :: Expr -> Integer
eval (Lit a) = a
eval (Add e e) = (eval a) + (eval b)

--Prelude> eval (Add (Lit 1) (Lit 9001))
--9002
--Prelude> eval (Add (Add (Lit 10) (Lit 10)) (Lit 50))
--70

printExpr :: Expr -> String
printExpr (Lit a) = show a
printExpr (Add x y) = (printExpr x) ++ " + " ++ (printExpr y)

--Prelude> printExpr (Add (Lit 1) (Lit 9001))
--"1 + 9001"
--Prelude> let a1 = Add (Lit 9001) (Lit 1)
--Prelude> let a2 = Add a1 (Lit 20001)
--Prelude> let a3 = Add (Lit 1) a2
--Prelude> printExpr a3
--"1 + 9001 + 1 + 20001"
