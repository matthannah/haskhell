{-# LANGUAGE TypeSynonymInstances, FlexibleInstances #-}

import Data.Maybe

data GameTree = Node Board [GameTree] deriving (Show, Eq)

data Board = Board Tile Tile Tile
                   Tile Tile Tile
                   Tile Tile Tile deriving (Eq)

type Tile = Maybe Token

data Token = X | O deriving (Show, Eq)

data Pos = A | B | C deriving (Show)

data Loc = Loc Pos Pos deriving (Show)

showBoard :: Board -> String
showBoard (Board t1 t2 t3 t4 t5 t6 t7 t8 t9) = "lol"

empty :: Board
empty = Board Nothing Nothing Nothing
              Nothing Nothing Nothing
              Nothing Nothing Nothing

-- List comprehension!