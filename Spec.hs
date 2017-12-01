module MarsRover.Test where

import MarsRover
import MarsRoverTypes
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "parse input correctly" $ do
    it "return empty string if input did not contain Rover" $ do
      let test = "5 5\n"
      process test `shouldBe` ""

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

  describe "move and spin Rover to correct position following serie of instructions" $ do
    it "Rover 1 (spec example)" $ do
      let actual = explore ((3,3), E) [M,M,R,M,M,R,M,R,R,M]
      actual `shouldBe` ((5,1),E)

    it "Rover 2 (spec example)" $ do
      let actual = explore ((1,2), N) [L,M,L,M,L,M,L,M,M]
      actual `shouldBe` ((1,3),N)
