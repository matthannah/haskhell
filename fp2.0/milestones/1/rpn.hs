import Data.Char (digitToInt)
import Data.Map.Strict (Map, fromList, findWithDefault)

op :: (Integer -> Integer -> Integer) -> [Integer] -> [Integer]
op fn (x:y:zs) = (fn x y) : zs
op _ _ = error "Called op on stack of size smaller than 2"

rpn :: String -> [Integer]
rpn s = foldl go [] s

go :: [Integer] -> Char -> [Integer]
go stack c
  | elem c ['0'..'9'] = toInteger (digitToInt c) : stack
  | otherwise = findWithDefault (error "unknown operator") c opMap $ stack

opMap :: Map Char ([Integer] -> [Integer])
opMap = fromList [('+', op (+)), ('-', op (-)), ('/', op (div)), ('*', op (*)), ('^', op (^))]
