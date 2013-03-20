module Main (main) where

import Test.Hspec
import Maze

main :: IO ()
main = hspec $ do
  describe "Maze" $ do
    it "compiles!" (return () :: IO ())

  describe "move" $ do
  	it "can move north" $ do
  		move N (1, 1) `shouldBe` (1, 0)