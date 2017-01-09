module Problems.P005
  ( solve
  ) where

{-
 - 2520 is the smallest number that can be divided by each of the numbers
 - from 1 to 10 without any remainder.
 -
 - What is the smallest positive number that is evenly divisible by all of
 - the numbers from 1 to 20?
 -}
solve :: String
solve = show $ solveProblem 20

solveProblem n = foldr lcm 1 [1 .. n]
