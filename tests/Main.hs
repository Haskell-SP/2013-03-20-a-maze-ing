module Main (main) where

import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "Maze" $ do
    it "compiles!" (return () :: IO ())
