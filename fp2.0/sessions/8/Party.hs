module Party where

import Employee
import Data.Monoid
import Data.Tree

-- adds an Employee to the GuestList (updating the cached Fun score appropriately)
glCons :: Employee -> GuestList -> GuestList
glCons e@(Emp en ef) (GL es f) = GL (e : es) (f + ef)

instance Monoid GuestList where
  mempty  = GL [] 0
  mappend (GL es1 f1) (GL es2 f2) = GL (es1 ++ es2) (f1 + f2)

moreFun :: GuestList -> GuestList -> GuestList
moreFun gl1@(GL _ f1) gl2@(GL _ f2)
    | f1 > f2 = gl1
    | otherwise = gl2

-- data Tree a = Node {
--   rootLabel :: a, -- label value
--   subForest :: [Tree a] -- zero or more child trees
-- }

-- Do more research on coming up with fold functions for types.. something to do with number of constructors
treeFold :: (a -> [b] -> b) -> Tree a -> b
treeFold f Node { rootLabel = r, subForest = s } = f r (map (treeFold f) s)

-- Takes the boss of the current subtree
-- A list of the results for each subtree under the boss
-- Each result is a pair of GuestLists:
--     * the first GuestList in the pair is the best possible guest list with the boss of that subtree
--     * the second is the best possible guest list without the boss of that subtree
-- nextLevel should then compute the overall best guest list that includes the boss and doesn't include the boss
nextLevel :: Employee -> [(GuestList, GuestList)] -> (GuestList, GuestList)
nextLevel e gls = (withBoss, withoutBoss)
  where
    withBoss = glCons e (foldr mappend (GL [] 0) (map snd gls))
    withoutBoss = foldr mappend (GL [] 0) (map (\(gl1, gl2) -> moreFun gl1 gl2) gls) -- this needs to be either fst or snd, depending on which is more fun
    -- TODO: can we leverage the Ord type class? to replace the shitty moreFun call above?

maxFun :: Tree Employee -> GuestList
maxFun t = moreFun (fst result) (snd result)
  where
    result = treeFold nextLevel t

glFormat :: GuestList -> String
glFormat (GL es f) = "Total fun: " ++ show f ++ "\n" ++
                     foldr (++) "" (map (\x -> empName x ++ "\n") es)

-- >>= bind
main :: IO ()
main = readFile "company.txt" >>= readIO >>= (return . maxFun) >>= (return . glFormat) >>= putStrLn
-- TODO: This is definitely wrong... i don't understand monads lol.. yet ;)
