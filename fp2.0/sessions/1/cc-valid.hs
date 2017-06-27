module CreditCardValidator where

toDigits :: Integer -> [Integer]
toDigits x
  | x <= 0 = []
  | x < 10 = [x]
  | otherwise = toDigits (x `div` 10) ++ [(x `mod` 10)]
  -- we can instead define this as:
  -- toDigits x = reverse.toDigitsRev (this is composing with eta reduction)

toDigitsRev :: Integer -> [Integer]
toDigitsRev x
  | x <= 0 = []
  | otherwise = x `mod` 10 : toDigitsRev (x `div` 10)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther x = reverse $ doubleEverySecond $ reverse x
  where doubleEverySecond (x1 : x2 : xs) = [x1, x2 * 2] ++ (doubleEverySecond xs)
        doubleEverySecond (x : []) = [x]
        doubleEverySecond xs =  xs
        -- we replace the last 2 pattern matches with:
        -- doubleEverySecond xs = xs
        -- we should use : instead of ++ in the first pattern match:
        -- x1 : x2 * 2 : doubleEverySecond xs
        -- we should name the function doubleEveryOther' instead of doubleEverySecond

sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x:xs)
  | x >= 10 = sumDigits ((toDigits x) ++ xs)
  | otherwise = x + sumDigits xs
  -- we can instead not use ++ operator by having this line as:
  -- | x >= 10 = sumDigits (toDigits x) + sumDigits xs

validate :: Integer -> Bool
validate x = (sumDigits $ doubleEveryOther $ toDigits x) `rem` 10 == 0
-- we can use composing here and eta reduction here too!
-- validate = (==0).(`rem`10).sumDigits.doubleEveryOther.toDigits
