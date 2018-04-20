newtype State s a = State { runState :: s -> (a, s) }

-- s is the state
-- a is the action that occurred as a result of run state

-- An example of this is reading a file, the state we need:
--   - operating system we are on
--   - directories/files we can see
--   - etc
-- use state over mutable variables! state is pure still.

-- Lets implement functor for State: below is my first version
-- instance Functor (State s) where
--   fmap f x = State go
--     where
--       go s = (f a, s')
--         where
--           (a, s') = runState x s

first :: (a -> b) -> (a, c) -> (b, c) -- helper function
first f (a, c) = (f a, c)

instance Functor (State s) where
  fmap f (State rs) = State ((first f) . rs)

-- TODO Refactor this
instance Applicative (State s) where
  pure a = State (\s -> (a, s))

  (State rs1) <*> (State rs2) = State go
    where
      go s = (f a, s'')
        where
          (f, s') = rs1 s
          (a, s'') = rs2 s'

-- Remember we can use fmap in here!
-- (<*>) :: Applicative f => State s (a -> b) -> State a -> State b
-- instance Applicative (State s) where
--   (State rs1) <*> (State rs2) =

-- (>>=) :: Monad m => m a -> (a -> m b) -> m b
-- State (rs :: s -> (a, s)) -> (a -> (State (rs :: s -> (b, s))) -> State (rs :: s -> (b, s))
-- instance Monad (State s) where
--   return a = State (\s -> (a, s))
--
--   (State rs1) >>= f = State go
--     where
--       go s = (b, s'')
--         where
--           (a, s') = rs1 s
--           st = f a
--           (b, s'') = runState st s' -- we need to preserve the s, which is why we call runState on the result of f a

instance Monad (State s) where
  return a = State (\s -> (a, s))
  (State rs1) >>= f = State ((\(a, s) -> runState (f a) s) . rs1)

-- run rs1 which will give us a result (a, s)
-- apply the a in (a, s) to f
-- combine result of f a to the s of (a, s) ???

