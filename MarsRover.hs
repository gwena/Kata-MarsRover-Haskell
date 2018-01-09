module MarsRover where

import MarsRoverTypes
import Parser

-- Calculate all Rover's new position and heading based on Input
exploreAll :: Input -> [Rover]
exploreAll (pos, rs) = map (\r -> explore pos (fst r) (snd r)) rs

-- Calculate Rover's new position and heading based on instructions
explore :: UpperRight -> Rover -> [Control] -> Rover
explore pos = foldl (step pos)

-- Calculate Rover's new position and heading based on one instruction
step :: UpperRight -> Rover -> Control -> Rover
step max (pos, cp) M = (move max pos cp, cp)
step _   (pos, cp) c = (pos, spin cp c)

-- Calculate Rover's new position based on one move forward
move :: UpperRight -> Position -> CardinalPoint -> Position
move (mx, my) (x, y) cp = (bound mx x (x + x'), bound my y (y + y'))
  where (x', y') = offset cp
        bound max old new = if (new >= 0) && (new <= max) then new else old

-- Calculate the offset for x and y coordinates based on moving in a direction
offset :: CardinalPoint -> (Int, Int)
offset N = (0,  1)
offset S = (0, -1)
offset E = (1,  0)
offset W = (-1, 0)

-- Spin a CardinalPoint to new orientation based on Left or Righ control
spin :: CardinalPoint -> Control -> CardinalPoint
spin N L = W
spin N R = E
spin E L = N
spin E R = S
spin S L = E
spin S R = W
spin W L = S
spin W R = N
spin c M = c

-- Show Rover based on Output requirement
displayRover :: Rover -> String
displayRover ((x, y), cp) = show x ++ " " ++ show y ++ " " ++ show cp

-- Process an input string of rovers and instructions to output rovers' new
-- positions and headings
process :: String -> String
process str = case parseInput str of
                Left e -> "ERROR: " ++ e
                Right r -> unlines $ map displayRover $ exploreAll r


