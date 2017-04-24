module Print3 where

greetingOne :: String

greetingOne = "hello" ++ " world!"

hello :: String
hello = "hello"

world :: String
world = "world!"

main :: IO ()
main = do
  putStrLn greetingOne
  putStrLn greetingTwo
  where greetingTwo = concat [hello, " ", world]
