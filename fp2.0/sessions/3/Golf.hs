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

histogram :: [Integer] -> String
histogram xs = tallyToString (tally xs) ++ "==========\n0123456789\n"

tallyToString :: [Integer] -> String
tallyToString xs = case (filter (> 0) xs) of
    [] -> []
    _  -> tallyToString (map (subtract 1) xs) ++ tallyLine xs

tallyLine :: [Integer] -> String
tallyLine [] = "\n"
tallyLine (z:zs)
  | z > 0 = '*' : tallyLine zs
  | otherwise = ' ' : tallyLine zs

tally :: [Integer] -> [Integer]
tally xs = go [0, 0, 0, 0, 0, 0, 0, 0, 0, 0] xs
  where
    go ys (z:zs) = go (addOneAtIndex z ys) zs
    go ys [] = ys

addOneAtIndex :: Integer -> [Integer] -> [Integer]
addOneAtIndex 0 (x:xs) = x + 1 : xs
addOneAtIndex n (x:xs) = x : addOneAtIndex (n - 1) xs
addOneAtIndex n [] = []
