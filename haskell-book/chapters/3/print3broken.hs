module Print3Broken where

-- To fix read the comments!

-- Add the following:
-- greeting :: String
-- greeting = "Yarrrrr"

printSecond :: IO ()
printSecond = do
  putStrLn greeting

main :: IO ()
main = do
  putStrLn greeting
  printSecond
  where greeting = "Yarrrrr" -- Remove this line
