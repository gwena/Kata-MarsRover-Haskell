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

  describe "move Rover to correct position" $ do
    it "add 1 on the y coordinate when going North" $ do
      move (10,10) (2,2) N `shouldBe` (2,3)

    it "substract 1 on the x coordinate when going West" $ do
      move (10,10) (2,2) W `shouldBe` (1,2)

  describe "keep Rover inside the plateau" $ do
    it "do not move further than bottom left" $ do
      let actual = explore (10,10) ((1,1), N) [M,L,M,M,M,M,L,L,M,M,M]
      actual `shouldBe` ((3,2),E)

    it "do not move further than the plateau, upper right" $ do
      let actual = explore (5,5) ((4,4), N) [M,M,M,M,M,M,L,M,M]
      actual `shouldBe` ((2,5),W)

  describe "move or spin rover based on control command" $ do
    it "move North" $ do
      step (10,10) ((2,2), N) M `shouldBe` ((2,3), N)

    it "spin West" $ do
      step (10,10) ((2,2), N) L `shouldBe` ((2,2), W)

  describe "move and spin Rover to correct position following serie of instructions" $ do
    it "calculate Rover 1's new position and heading (spec example)" $ do
      let actual = explore (10,10) ((3,3), E) [M,M,R,M,M,R,M,R,R,M]
      actual `shouldBe` ((5,1),E)

    it "calculate Rover 2's new position and heading (spec example)" $ do
      let actual = explore (10,10) ((1,2), N) [L,M,L,M,L,M,L,M,M]
      actual `shouldBe` ((1,3),N)

  describe "end to end testing" $ do
    it "create output for 2 Rovers moved and spinned following instructions (spec example) " $ do
      let test = "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM\n"
      process test `shouldBe` "1 3 N\n5 1 E\n"


