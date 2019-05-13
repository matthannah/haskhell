module MaybeT where

import           Data.Char

--https://en.wikibooks.org/wiki/Haskell/Monad_transformers

getPassphrase :: IO (Maybe String)
getPassphrase = do
    s <- getLine
    if isValid s then return $ Just s else return Nothing

-- The validation test could be anything we want it to be.
isValid :: String -> Bool
isValid s =
    length s >= 8
    && any isAlpha s
    && any isNumber s
    && any isPunctuation s

askPassphrase :: IO ()
askPassphrase = do
    putStrLn "Insert your new passphrase:"
    maybeValue <- getPassphrase
    case maybeValue of
        Just value -> do putStrLn "Storing in database..."  -- do stuff
        Nothing    -> putStrLn "Passphrase invalid."

-- This sucks... we are pattern matching on the maybe value. Lets use the MaybeT
-- monad transformer.

-- MaybeT is a wrapper around m (Maybe a), where m can be any monad (IO in our
-- example):

newtype MaybeT m a = MaybeT { runMaybeT :: m (Maybe a) }

instance Functor f => Functor (MaybeT f) where
    -- fmap :: (a -> b) -> f a -> f b
    -- fmap :: (a -> b) -> MaybeT f a -> MaybeT f b
    fmap f mt = MaybeT (fmap f <$> runMaybeT mt)

instance Monad m => Applicative (MaybeT m) where
    -- pure :: a -> m a
    -- pure :: a -> MaybeT m a
    pure = MaybeT . pure . Just

    -- (<*>) :: m (a -> b) -> m a -> m b
    -- (<*>) :: MaybeT m (a -> b) -> MaybeT m a -> MaybeT m b
    (<*>) mtf mt = MaybeT $ do
        f <- runMaybeT mtf
        a <- runMaybeT mt
        pure $ f <*> a

instance Monad m => Monad (MaybeT m) where
    -- return :: a -> m a
    -- return :: a -> MaybeT m a
    return = MaybeT . pure . Just

    -- (>>=) :: m a -> (a -> m b) -> m b
    -- (>>=) :: MaybeT m a -> (a -> MaybeT m b) -> MaybeT m b
    (>>=) mt f = MaybeT $ do
        m <- runMaybeT mt
        case m of
            Nothing -> pure Nothing
            Just a  -> runMaybeT $ f a

-- lift :: Monad m => m a -> t m a
