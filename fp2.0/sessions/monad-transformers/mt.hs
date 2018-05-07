-- monad transformers end with capital T

-- We will be looking at MaybeT (the monad transformer for Maybe)

-- newtype MaybeT m a = MaybeT { runMaybeT :: m (Maybe a) }
--
-- instance (Monad m) => Monad (MaybeT m) where
--   return a = MaybeT (return (Just a))
--   -- (>>=) :: MaybeT m a -> (a -> MaybeT m b) -> MaybeT m b
--   (MaybeT rmt) >>= f

--   (StateT rst) >>= f = StateT go
--     where
--       go s = mbs
--         where
--           mbs = mas >>= (\(a, s') -> runStateT (f a) s') -- apply function to a, and runStateT again to preserve the s in mab
--           mas = rst s -- this gives m (a, s) step #1

first :: (a -> b) -> (a, c) -> (b, c) -- helper function
first f (a, c) = (f a, c)

newtype StateT s m a = StateT { runStateT :: s -> m (a, s) }

instance (Monad m) => Monad (StateT s m) where
  return a = StateT (\s -> return (a, s))
  (StateT rst) >>= f = StateT ((>>= (\(a, s) -> runStateT (f a) s)) . rst)

instance (Monad m) => Applicative (StateT s m) where
  pure a = StateT (\s -> pure (a, s))
  (StateT rst1) <*> (StateT rst2) = StateT ((>>= (\(fab, s) -> fmap (first fab) (rst2 s))) . rst1)

instance (Monad m) => Functor (StateT s m) where
  fmap fab (StateT rst) = StateT ((fmap (first fab)) . rst)
