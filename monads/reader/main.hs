module Main where

-- where e is some "environment" and a is some value you create from that "environment"
newtype Reader e a = Reader { runReader :: e -> a }

instance Functor (Reader e) where
    -- fmap :: (a -> b) -> f a -> f b
    -- fmap :: (a -> b) -> Reader { runReader :: e -> a } -> Reader { runReader :: e -> b }
    fmap f g = Reader (\e -> f ((runReader g) e))

instance Applicative (Reader e) where
    -- pure :: a -> f a
    -- pure :: a -> Reader { runReader :: e -> a }
    pure a = Reader (\_ -> a)
    -- (<*>) :: f (a -> b) -> f a -> f b
    -- (<*>) :: Reader { runReader :: e -> a -> b } -> Reader { runReader :: e -> a } -> Reader { runReader :: e -> b }
    (<*>) f g = Reader (\e -> ((runReader f) e) ((runReader g) e))

instance Monad (Reader e) where
    -- return :: a -> f a
    -- return :: a -> Reader { runReader :: e -> a }
    return a = Reader (\_ -> a)
    -- (>>=) :: m a -> m (a -> m b) -> m b
    -- (>>=) :: Reader { runReader :: e -> a } -> (a -> Reader { runReader :: e -> b } -> Reader { runReader :: e -> b }
    (>>=) f g = Reader (\e -> (runReader (g ((runReader f) e))) e)

data Environment = Environment
    { age  :: Int
    , name :: String
    }

myEnvironment :: Environment
myEnvironment = Environment 1 "matt"

computation :: Reader Environment Int
computation = do
    a <- computation1
    b <- computation2
    return (a + b)

computation1 :: Reader Environment Int
computation1 = do
    a <- asks age
    return a

computation2 :: Reader Environment Int
computation2 = do
    a <- asks name
    return $ length a

asks :: (e -> a) -> Reader e a
asks f = Reader f

-- test with:
-- runReader computation $ myEnvironment

main :: IO ()
main = pure ()
