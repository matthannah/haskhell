{-# LANGUAGE InstanceSigs #-}

import Data.Either

void :: (Functor f) => f a -> f ()
void x = fmap (const ()) x

-- create a newtype Neither that wraps type Either
newtype Neither a b = Neither (Either a b)

-- right = correct, left = error
instance Functor (Neither e) where
    fmap :: (a -> b) -> Neither e a -> Neither e b
    fmap f (Neither (Left a)) = Neither (Left a)
    fmap f (Neither (Right a)) = Neither (Right (f a))

newtype Arrow a b = Arrow (a -> b)

-- fmap :: (a -> b) -> (e -> a) -> (e -> b)
instance Functor (Arrow e) where
    fmap :: (a -> b) -> Arrow e a -> Arrow e b
    fmap    f          (Arrow g)   = Arrow (\a -> f (g a))

newtype Pair a b = Pair (a, b)

--fmap :: (a -> b) -> (e, a) -> (e, b)
instance Functor (Pair e) where
    fmap :: (a -> b) -> Pair e a    -> Pair e b
    fmap    f          (Pair (e, a)) = Pair (e, (f a))
