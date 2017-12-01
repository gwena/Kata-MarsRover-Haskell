module MarsRover where

import MarsRoverTypes
import Parser

process :: String -> String
process str = case parseInput str of
                Left e -> "ERROR: " ++ e
                Right r -> "Parsed"

