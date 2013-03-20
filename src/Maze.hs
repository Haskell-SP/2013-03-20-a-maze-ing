module Maze {-(
    Maze
  , Size
  )-} where

import qualified Data.Map as M
import Data.Map (Map)

data Cell = Cell {
    southWall :: Bool
  , eastWall  :: Bool	
  } 

data Maze = Maze
  { size :: Size
  , topology :: Map Position Cell
  }

type Position = (Int, Int)

type Size = (Int, Int)

empty :: Size -> Maze
empty = flip Maze M.empty 

data Direction = N | S | E | W deriving (Eq, Ord, Show, Read, Enum)

canMoveTo :: Maze -> Position -> Direction -> Bool
canMoveTo _ (0, _) W = False
canMoveTo _ (_, 0) N = False

canMoveTo m (a, b) E = False
