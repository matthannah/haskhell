-- Example of skips:
-- skips "ABCD" == ["ABCD", "BD", "C", "D"]
-- skips "hello!" == ["hello!", "el!", "l!", "l", "o", "!"]
-- skips [1] == [[1]]
-- skips [True,False] == [[True,False], [False]]
-- skips [] == []
skips :: [a] -> [[a]]
skips xs = go (length xs) xs
  where
    go 0 xs = []
    go n xs = go (n - 1) xs ++ [every n xs]


every :: Int -> [a] -> [a]
every n xs = case (drop (n - 1) xs) of
  (x:xs) -> x : every n xs
  [] -> []

-- Example of localMaxima:
-- localMaxima [2,9,5,6,1] == [9,6]
-- localMaxima [2,3,4,1,5] == [4]
-- localMaxima [1,2,3,4,5] == []
localMaxima :: [Integer] -> [Integer]
localMaxima (x:y:z:xs)
  | y > x && y > z = y : localMaxima (z:xs)
  | otherwise = localMaxima (y:z:xs)
localMaxima xs = []
