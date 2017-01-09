module Problems.P077
  ( solve
  ) where

-- 077.hs
{-
 - It is possible to write ten as the sum of primes in exactly five different
 - ways:
 -
 - 7 + 3
 - 5 + 5
 - 5 + 3 + 2
 - 3 + 3 + 2 + 2
 - 2 + 2 + 2 + 2 + 2
 -
 - What is the first value which can be written as the sum of primes in over
 - five thousand different ways?
 -}
import Util.Math (coinCombos)
import Util.Prime (primes)

solve :: String
solve = show $ solveProblem 5000

solveProblem bound =
  let prime_parts = coinCombos (map fromIntegral primes)
      ans = filter (\(n, p) -> p > bound) $ zip [0 ..] prime_parts
  in fst $ head ans
