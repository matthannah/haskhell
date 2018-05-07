{-# LANGUAGE TupleSections #-}

module IO (gameLoop) where

import System.IO (hFlush, stdout)
import Text.Read (readMaybe)

gameLoop :: (Read i)
         => (b -> String)       -- ^ How to show the board
         -> (r -> String)       -- ^ How to show the result
         -> (b -> Maybe r)      -- ^ Is there a game result?
         -> (i -> b -> Maybe b) -- ^ Update the board given input
         -> b                   -- ^ Initial board
         -> IO ()
gameLoop sb sr won add b0 = declare =<< inputLoop
  where
    declare (b, res) = putStrLn (sb b) *> putStrLn (sr res)
    inputLoop = iterateUntilJust won' turn b0

    won' a = (a,) <$> won a
    turn a = putStrLn (sb a) *> untilJust (tryInsert a =<< untilJust prompt)
    prompt = putStr "Enter a move like (0,0): " *> hFlush stdout *> (readMaybe <$> getLine)
    tryInsert a coords
      | Just a' <- add coords a = pure $ Just a'
      | otherwise               = Nothing <$ putStrLn "That is not a valid move"
    -- Originally from Control.Monad.Loops
    untilJust :: (Monad m) => m (Maybe a) -> m a
    untilJust ma = iterateUntilJust id (const ma) Nothing
    iterateUntilJust :: (Monad m) => (a -> Maybe b) -> (a -> m a) -> a -> m b
    iterateUntilJust p f v
      | Just b <- p v = pure b
      | otherwise     = iterateUntilJust p f =<< f v


