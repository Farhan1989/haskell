module Problems.P087
  ( solve
  ) where

{-
 - The smallest number expressible as the sum of a prime square, prime cube,
 - and prime fourth power is 28. In fact, there are exactly four numbers below
 - fifty that can be expressed in such a way:
 -
 - 28 = 2^2 + 2^3 + 2^4
 - 33 = 3^2 + 2^3 + 2^4
 - 49 = 5^2 + 2^3 + 2^4
 - 47 = 2^2 + 3^3 + 2^4
 -
 - How many numbers below fifty million can be expressed as the sum of a prime
 - square, prime cube, and prime fourth power?
 -}

import qualified Data.Set as S
import qualified Util.Prime as Prime

solve :: String
solve = show $ solveProblem 50e6

solveProblem bound =
  S.size $ S.fromList
        [ p2 + p3 + p4
        | p4 <- takeWhile (< bound) $ map (^ 4) Prime.primes
        , p3 <- takeWhile (< bound - p4) $ map (^ 3) Prime.primes
        , p2 <- takeWhile (< bound - p4 - p3) $ map (^ 2) Prime.primes
        ]
