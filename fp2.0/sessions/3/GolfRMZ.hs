skips :: [a] -> [[a]]
skips x = map (e x) [1..(length x)]

e :: [a] -> Int -> [a]
e y n
  | length y >= n = head (drop (n - 1) y) : e (drop n y) n
  | otherwise = []

-- localMaxima [2,9,5,6,1] == [9,6]
localMaxima :: [Integer] -> [Integer]
localMaxima (x:t@(y:z:a))
  | y > z && y > x = y : localMaxima t
  | otherwise = localMaxima t
localMaxima xs = []

c :: [Integer] -> Integer -> Int
c x n = length (filter (==n) x)

t :: [Integer] -> [Int]
t x = map (c x) [0..9]

l :: [Int] -> String
l [] = "\n"
l (x:y)
  | x > 0 = '*' : l y
  | otherwise = ' ' : l y

histogram :: [Integer] -> String
histogram x = go (t x) ++ "==========\n0123456789\n"
  where
    go x
      | length (filter (>0) x) > 0 = go (map (subtract 1) x) ++ l x
      | otherwise = []
