module MarsRoverTypes where

data CardinalPoint = N | S | E | W deriving (Show, Eq)
data Control = L | R | M
type Position = (Int, Int)
type Rover = (Position, CardinalPoint)
type Input = (Position, [(Rover, [Control])])
