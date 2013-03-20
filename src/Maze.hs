module Maze (
    Maze
  ) where

import Data.Map

data Cell = Cell {
    southWall :: Bool
  , eastWall  :: Bool	
  } 

data Maze = Maze Size Map

type Position = (Int, Int)

type Size = (Int, Int)

empty :: Size -> Maze
empty = undefined

data Direction = N | S | E | W deriving (Eq, Ord, Show, Read, Enum)

canMoveTo :: Maze -> Position -> Direction -> Bool
canMoveTo m p d = False


