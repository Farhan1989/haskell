module Problems.P026
  ( solve
  ) where

import Data.Function (on)
import Data.List (nub, (\\))
import Util.Math (powerMod)

import Util.List (maximumBy)
{-
 - A unit fraction contains 1 in the numerator. The decimal representation of the
 - unit fractions with denominators 2 to 10 are given:
 -
 -     1/2  = 0.5
 -     1/3  = 0.(3)
 -     1/4  = 0.25
 -     1/5  = 0.2
 -     1/6  = 0.1(6)
 -     1/7  = 0.(142857)
 -     1/8  = 0.125
 -     1/9  = 0.(1)
 -     1/10 = 0.1
 -
 - Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be
 - seen that 1/7 has a 6-digit recurring cycle.
 -
 - Find the value of d < 1000 for which 1/d contains the longest recurring cycle
 - in its decimal fraction part.
 -}
import Util.Prime (factors)

solve :: String
solve = show $ solveProblem 999

solveProblem :: Integer -> Integer
solveProblem bound = maximumBy repetandLength [1 .. bound]

carmichael
  :: Integral a
  => a -> Int
carmichael p = 1 + length (takeWhile (/= 1) [powerMod 10 n p | n <- [1 ..]])

repetandLength :: Integer -> Int
repetandLength d =
  let good_factors = nub (factors d) \\ [2, 5]
  in foldl lcm 1 $ map carmichael good_factors
