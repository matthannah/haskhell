module Hanoi where

type Peg = String
type Move = (Peg, Peg)

-- Example:
-- hanoi 2 "a" "b" "c" == [("a","c"), ("a","b"), ("c","b")]
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []
hanoi n a b c = hanoi (n - 1) a c b ++ [(a, b)] ++ hanoi (n - 1) c b a
-- we can replace one of the ++ with the : operator!
-- hanoi n a b c = hanoi (n - 1) a c b ++ ((a, b) : (hanoi (n - 1) c b a))

-- TODO: hanoiFour
--hanoiFour :: Integer -> Peg -> Peg -> Peg -> Peg -> [Move]
--hanoiFour n a b c d
