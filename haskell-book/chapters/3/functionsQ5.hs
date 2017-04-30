module Q5 where

rvrs x    = concat [a, b, c]
  where a = drop 9 x
        b = drop 5 $ take 9 x
        c = take 5 x
