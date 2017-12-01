module MarsRover where

import MarsRoverTypes
import Parser

move :: Position -> CardinalPoint -> Position
move (x, y) cp = (x + x', y + y')
   where (x', y') = offset cp

offset :: CardinalPoint -> (Int, Int)
offset N = (0,  1)
offset S = (0, -1)
offset E = (1,  0)
offset W = (-1, 0)

process :: String -> String
process str = case parseInput str of
                Left e -> "ERROR: " ++ e
                Right r -> "Parsed"

