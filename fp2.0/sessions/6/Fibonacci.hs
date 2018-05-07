{-# LANGUAGE FlexibleInstances #-}

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib x = fib (x - 1) + fib (x - 2)

-- Inefficient AF ;)
fibs1 :: [Integer]
fibs1 = map fib [0..]

-- lazy evaluation POWA!
fibs2 :: [Integer]
fibs2 = 0 : 1 : zipWith (+) fibs2 (tail fibs2)

data Stream a = Cons a (Stream a)

streamToList :: Stream a -> [a]
streamToList (Cons a s) = a : (streamToList s)

instance Show a => Show (Stream a) where
  show = show . take 40 . streamToList

-- which generates a stream containing infinitely many copies of the given
-- element.
streamRepeat :: a -> Stream a
streamRepeat a = Cons a (streamRepeat a)

-- which applies a function to every element of sa Stream
streamMap :: (a -> b) -> Stream a -> Stream b
streamMap f (Cons a s) = Cons (f a) (streamMap f s)

-- which generates a Stream from a “seed” of type a, which is the
-- first element of the stream, and an “unfolding rule” of type a -> a
-- which specifies how to transform the seed into a new seed, to be
-- used for generating the rest of the stream.
streamFromSeed :: (a -> a) -> a -> Stream a
streamFromSeed f d = Cons d (streamFromSeed f (f d))

nats :: Stream Integer
nats = streamFromSeed (+1) 0

-- where the nth element in the stream (assuming the first element
-- corresponds to n = 1) is the largest power of 2 which evenly
-- divides n
ruler :: Stream Integer
ruler = go 0 where
  go x = interleaveStreams (streamRepeat x) (go (x + 1))

interleaveStreams :: Stream a -> Stream a -> Stream a
interleaveStreams (Cons a as) bs = Cons a (interleaveStreams bs as)

x :: Stream Integer
