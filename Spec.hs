module MarsRover.Test where

import MarsRover
import MarsRoverTypes
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "parse input correctly" $ do
    it "return Parsed message if input was valid" $ do
      let test = "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM\n"
      process test `shouldBe` "Parsed"

    it "return Error message if input was invalid " $ do
      let test = "5 5a\n1 giberish\n"
      process test `shouldStartWith` "ERROR: "

  describe "move rover to correct position" $ do
    it "add 1 on the y coordinate when going North" $ do
      move (2,2) N `shouldBe` (2,3)

    it "substract 1 on the x coordinate when going West" $ do
      move (2,2) W `shouldBe` (1,2)

  describe "move or spin rover based on control command" $ do
    it "move North" $ do
      step ((2,2), N) M `shouldBe` ((2,3), N)

    it "spin West" $ do
      step ((2,2), N) L `shouldBe` ((2,2), W)

