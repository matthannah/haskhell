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
