module Main where

import Data.List

-- There is a secret string which is unknown to you. Given a collection of
-- random triplets from the string, recover the original string.
--
-- A triplet here is defined as a sequence of three letters such that each
-- letter occurs somewhere before the next in the given string. "whi" is a
-- triplet for the string "whatisup".
--
-- As a simplification, you may assume that no letter occurs more than once in
-- the secret string.
--
-- You can assume nothing about the triplets given to you other than that they
-- are valid triplets and that they contain sufficient information to deduce the
-- original string. In particular, this means that the secret string will never
-- contain letters that do not occur in one of the triplets given to you.

secret = "whatisup"
triplets = ["tup"
           ,"whi"
           ,"tsu"
           ,"ats"
           ,"hap"
           ,"tis"
           ,"whs"
           ]

secret2 = "mathisfun"
triplets2 = ["tsf"
            ,"asu"
            ,"maf"
            ,"ain"
            ,"sun"
            ,"mfu"
            ,"ath"
            ,"thi"
            ,"hif"
            ,"mhf"
            ,"aun"
            ,"mat"
            ,"fun"
            ,"hsn"
            ,"ais"
            ,"msn"
            ,"msu"
            ]

newtype Vertex a = Vertex a deriving (Eq, Show)

newtype Edge a = Edge (a, a) deriving (Eq, Show)

data Graph a = Graph
    { verticies :: [Vertex a]
    , edges     :: [Edge a]
    } deriving (Eq, Show)

vertexVal :: Vertex a -> a
vertexVal (Vertex a) = a

fstEdge :: Edge a -> a
fstEdge (Edge (x, _)) = x

sndEdge :: Edge a -> a
sndEdge (Edge (_, y)) = y

addUnique :: Eq a => a -> [a] -> [a]
addUnique a xs
  | a `elem` xs = xs
  | otherwise   = a:xs

addVertex :: Eq a => Vertex a -> Graph a -> Graph a
addVertex a (Graph vs es) = Graph (addUnique a vs) es

addEdge :: Eq a => Edge a -> Graph a -> Graph a
addEdge a (Graph vs es) = Graph vs (addUnique a es)

addToGraph :: String -> Graph Char -> Graph Char
addToGraph [] g = g
addToGraph (x:[]) g = addVertex (Vertex x) g
addToGraph (x:y:xs) g = addToGraph (y:xs) $ addVertex (Vertex y) (addVertex (Vertex x) (addEdge (Edge (x, y)) g))

removeVertex :: Eq a => Vertex a -> Graph a -> Graph a
removeVertex v@(Vertex a) g = Graph ((verticies g) \\ [v]) (removeIncomingEdges a (edges g))

removeIncomingEdges :: Eq a => a -> [Edge a] -> [Edge a]
removeIncomingEdges e es = filter ((/= e) . fstEdge) es

noIncomingEdges :: Eq a => Graph a -> Vertex a
noIncomingEdges g = head $ (verticies g) \\ (incomingVertexes [] (edges g))
  where incomingVertexes seen [] = seen
        incomingVertexes seen (e:es) = incomingVertexes (Vertex (sndEdge e):seen) es

topologicalSort :: Eq a => Graph a -> [a]
topologicalSort = go []
  where go sort g
          | verticies g == [] = sort
          | otherwise         = (vertexVal vertex) : (topologicalSort (removeVertex vertex g))
          where vertex = noIncomingEdges g

tripletsToGraph :: [String] -> Graph Char
tripletsToGraph = foldr addToGraph (Graph [] [])

recoverSecret :: [String] -> String
recoverSecret = topologicalSort . tripletsToGraph

main :: IO ()
main = do
  print $ recoverSecret triplets