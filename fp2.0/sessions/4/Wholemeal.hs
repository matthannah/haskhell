import Data.Bool (bool)

fun1 :: [Integer] -> Integer
fun1 [] = 1
fun1 (x:xs)
  | even x = (x - 2) * fun1 xs
  | otherwise = fun1 xs

fun1' :: [Integer] -> Integer
fun1' = foldr (*) 1 . map (subtract 2) . filter (even)

fun2 :: Integer -> Integer
fun2 1 = 0
fun2 n
  | even n = n + fun2 (n `div` 2)
  | otherwise = fun2 (3 * n + 1)

fun2' :: Integer -> Integer
fun2' = foldr (+) 0 . filter even . takeWhile (/= 1) . iterate (\x -> bool (x * 3 + 1) (x `div` 2) (even x))

data Tree a = Leaf | Node Integer (Tree a) a (Tree a) deriving (Show, Eq)

foldTree :: [a] -> Tree a
foldTree = foldr insert Leaf

insert :: a -> Tree a -> Tree a
insert a Leaf = Node 0 Leaf a Leaf
-- TODO: Finish this

height :: Tree a -> Integer
height Leaf = 0
height (Node h _ _ _) = h
