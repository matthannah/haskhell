module Main where

ints :: [Int]
ints = do
  a <- [1,2,3]
  [a, a, a]

main :: IO ()
main = do
  print ints
