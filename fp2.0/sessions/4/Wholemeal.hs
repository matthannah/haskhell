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
insert a t@(Node h l v r)
  | numNodes l < numNodes r = Node (height h) (insert a l) v r
  | otherwise               = Node (height h) l v (insert a r)
    where
      height h = (bool h (h + 1) (isFull t))

isFull :: Tree a -> Bool
isFull Leaf = True
isFull (Node _ Leaf v Leaf) = True
isFull (Node _ l@(Node _ _ _ _) v r@(Node _ _ _ _)) = (isFull l) && (isFull r)
isFull _ = False

numNodes :: Tree a -> Integer
numNodes Leaf = 0
numNodes (Node _ l _ r) = 1 + numNodes l + numNodes r

-- Code for showing the tree

buildListOfValue :: Integer -> a -> [a]
buildListOfValue len val
  | len < 1   = []
  | otherwise = val : (buildListOfValue (len - 1) val)

treeToString :: Show a => Tree a -> String
treeToString Leaf = ""
treeToString t@(Node h _ _ _) = go h t
  where
    go _ Leaf = ""
    go i (Node _ l v r) = (go (i - 1) l) ++ (buildListOfValue (8 * i) ' ') ++ (show v) ++ "\n" ++ (go (i - 1) r)

-- which returns True if and only if there are an odd number of True values contained in the input list
xor :: [Bool] -> Bool
xor = odd . foldl count 0
  where
    count acc x
      | x = acc + 1
      | otherwise = acc

-- Implement map as a fold. That is, complete the definition, and acts the same way as map, except it uses a fold
map' :: (a -> b) -> [a] -> [b]
map' f = foldr f' []
  where
    f' a xs = f a : xs

-- Implement foldl using foldr. That is, complete the definition
--
--   myFoldl :: (a -> b -> a) -> a -> [b] -> a
--   myFoldl f base xs = foldr ...
--
-- in such a way that myFoldl behaves identically to the standard foldl function.
--
-- Hint: Study how the application of foldr and foldl work out:
-- foldr f z [x1, x2, ..., xn] == x1 ‘f‘ (x2 ‘f‘ ... (xn ‘f‘ z)...)
-- foldl f z [x1, x2, ..., xn] == (...((z ‘f‘ x1) ‘f‘ x2) ‘f‘...) ‘f‘ xn

-- SOLUTION:
--
-- reverse the list so that the last element is the one that is evaluated first by foldr
-- flip the function params so that it can be passed to foldr
-- note that flip still calls the function the same way, it just changes the order you pass arguments in

-- Example:
func :: Bool -> Integer -> Integer
func b v
  | b = v + 1
  | otherwise = v

flippedFunc :: Integer -> Bool -> Integer
flippedFunc = flip func

-- func True 1 == 2
-- flippedFunc 1 True == 2
--
-- I can even implement flip, it's easy:

myFlip :: (a -> b -> c) -> b -> a -> c
myFlip f x y = f y x

myFlippedFunc :: Integer -> Bool -> Integer
myFlippedFunc = myFlip func

myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl f base xs = foldr (flip f) base (reverse xs)

-- Given an integer n, your function should generate all the odd prime numbers up to 2n + 2.
-- Implement the algorithm http://en.wikipedia.org/wiki/Sieve_of_Sundaram using function composition
sieveSundaram :: Integer -> [Integer]
sieveSundaram n =  [1 .. ]
