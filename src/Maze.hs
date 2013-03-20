module Maze (
    Maze
  ) where

import qualified Data.Map as M
import Data.Map (Map)

data Cell = Cell {
    southWall :: Bool
  , eastWall  :: Bool	
  } 

data Maze = Maze Size (Map Position Cell) 

type Position = (Int, Int)

type Size = (Int, Int)

empty :: Size -> Maze
empty sz = Maze 	 

data Direction = N | S | E | W deriving (Eq, Ord, Show, Read, Enum)

canMoveTo :: Maze -> Position -> Direction -> Bool
canMoveTo m p d = False

