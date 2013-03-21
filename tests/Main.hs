module Main (main) where

import Test.Hspec
import Test.Hspec.QuickCheck
import Maze
import qualified Data.Map as M
import Test.QuickCheck

instance Arbitrary Direction where
  arbitrary = arbitraryBoundedEnum


main :: IO ()
main = hspec $ do
  describe "Maze" $ do
    it "compiles!" (return () :: IO ())

  describe "move" $ do
    it "can move north" $ do
      move N (1, 1) `shouldBe` (1, 0)
    prop "going direction and going back  leads to the same place" $ 
      \p d -> move (opposite d) (move d p) == p


  describe "canMoveTo " $ do
    it "can not move South " $ do
      canMoveTo (empty (1,1)) (0, 0) S `shouldBe` False

    it "can move South " $ do
      canMoveTo (empty (2,2)) (0, 0) S `shouldBe` True

  describe "can insert walls " $ do
    it "cant move into a wall" $ do
      canMoveTo (insertWall (empty (2,2)) (0, 0) S) (0, 0) S `shouldBe` False
      
    prop "cant move into random walls" $ 
      \p d -> canMoveTo (insertWall (empty (fst p + 2, snd p + 2)) p d) p d == False
