module MarsRover.Test where

import MarsRover
import MarsRoverTypes
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "parse input correctly" $ do
    it "return Parsed message if input was valid " $ do
      let test = "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM\n"
      process test `shouldBe` "Parsed"

    it "return Error message if input was invalid " $ do
      let test = "5 5a\n1 giberish\n"
      process test `shouldStartWith` "ERROR: "

