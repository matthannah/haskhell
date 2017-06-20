module CreditCardValidator where

toDigits :: Integer -> [Integer]
toDigits x
  | x <= 0 = []
  | x < 10 = [x]
  | otherwise = toDigits (x `div` 10) ++ [(x `mod` 10)]

toDigitsRev :: Integer -> [Integer]
toDigitsRev x
  | x <= 0 = []
  | otherwise = x `mod` 10 : toDigitsRev (x `div` 10)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther x = reverse $ doubleEverySecond $ reverse x
  where doubleEverySecond (x1 : x2 : xs) = [x1, x2 * 2] ++ (doubleEverySecond xs)
        doubleEverySecond (x : []) = [x]
        doubleEverySecond xs = xs

sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x:xs)
  | x > 10 = sumDigits ((toDigits x) ++ xs)
  | otherwise = x + sumDigits xs

validate :: Integer -> Bool
validate x = value `rem` 10 == 0
  where value = sumDigits $ doubleEveryOther $ toDigits x
