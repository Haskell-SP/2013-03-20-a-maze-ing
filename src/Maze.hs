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
canMoveTo m (_, y) E | fst (size m) + 1 == y = False
canMoveTo m (x, _) S | snd (size m) + 1 == x = False
canMoveTo m p S = case M.lookup p (topology m) of
					  Just c  -> not $ southWall c
					  Nothing -> True
canMoveTo m p E = case M.lookup p (topology m) of
					  Just c  -> not $ eastWall c
					  Nothing -> True
canMoveTo m p N = canMoveTo m (move N p) S
canMoveTo m p W = canMoveTo m (move W p) E

move :: Direction -> Position -> Position
move W (x, y) = (x - 1, y)
move E (x, y) = (x + 1, y)
move N (x, y) = (x, y - 1)
move S (x, y) = (x, y + 1)
