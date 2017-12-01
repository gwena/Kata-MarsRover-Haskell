module MarsRover where

import MarsRoverTypes
import Parser

-- Calculate Rover's new position and heading based on instructions
explore :: Rover -> [Control] -> Rover
explore = foldl step

-- Calculate Rover's new position and heading based on one instruction
step :: Rover -> Control -> Rover
step (pos, cp) M = (move pos cp, cp)
step (pos, cp) c = (pos, spin cp c)

-- Calculate Rover's new position based on one move forward
move :: Position -> CardinalPoint -> Position
move (x, y) cp = (x + x', y + y')
   where (x', y') = offset cp

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

-- Process an input string of rovers and instructions to output rovers' new
-- positions and headings
process :: String -> String
process str = case parseInput str of
                Left e -> "ERROR: " ++ e
                Right r -> "Parsed"


