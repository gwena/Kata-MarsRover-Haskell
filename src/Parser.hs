module Parser where

import MarsRoverTypes
import Text.Parsec
import Text.ParserCombinators.Parsec.Number
import Text.Parsec.Error
import Control.Applicative hiding ((<|>), many)

-- Parse input string using a parser
-- Return Right Input if correct format, else Left with error message
parseInput :: String -> Either String Input
parseInput str = case parse input "" str of
                   Left e -> Left (show $ map messageString (errorMessages e))
                   Right result -> Right result

-- Parser for input string using monadic parsers combinators - simpler parsers below
input :: Parsec String () Input
input = (,) <$> position <* newline <*> many roverWithInstructions <* eof

roverWithInstructions :: Parsec String () (Rover, [Control])
roverWithInstructions = (,) <$> rover <*> many control <* newline

rover :: Parsec String () Rover
rover = (,) <$> position <* space <*> heading <* newline

position :: Parsec String () Position
position = (,) <$> nat <* space <*> nat

heading :: Parsec String () CardinalPoint
heading = N <$ char 'N' <|> S <$ char 'S' <|> E <$ char 'E' <|> W <$ char 'W'

control :: Parsec String () Control
control = L <$ char 'L' <|> R <$ char 'R' <|> M <$ char 'M'
