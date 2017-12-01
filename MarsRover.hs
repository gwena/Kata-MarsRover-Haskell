module MarsRover where

import MarsRoverTypes
import Parser

explore :: Rover -> [Control] -> Rover
explore = foldl step

step :: Rover -> Control -> Rover
step (pos, cp) M = (move pos cp, cp)
step (pos, cp) c = (pos, spin cp c)

move :: Position -> CardinalPoint -> Position
move (x, y) cp = (x + x', y + y')
   where (x', y') = offset cp

offset :: CardinalPoint -> (Int, Int)
offset N = (0,  1)
offset S = (0, -1)
offset E = (1,  0)
offset W = (-1, 0)

spin :: CardinalPoint -> Control -> CardinalPoint
spin N L = W
spin N R = E
spin E L = N
spin E R = S
spin S L = E
spin S R = W
spin W L = S
spin W R = N

process :: String -> String
process str = case parseInput str of
                Left e -> "ERROR: " ++ e
                Right r -> "Parsed"


