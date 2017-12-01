module MarsRoverTypes where

data CardinalPoint = N | S | E | W deriving (Show, Eq)
data Control = L | R | M
type Position = (Int, Int)
type UpperRight = Position
type Rover = (Position, CardinalPoint)
type Input = (UpperRight, [(Rover, [Control])])
