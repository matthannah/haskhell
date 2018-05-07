void :: (Functor f) => f a -> f ()
void x = fmap (\a -> ()) x

newtype Neither a b = Neither (Either a b)

instance Functor Neither where
  fmap :: (a -> b) -> Neither a a -> Neither a b
  fmap _ = Nothing
  fmap g (Just a) = Just (g a)