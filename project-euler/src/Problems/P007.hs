module Problems.P007
  ( solve
  ) where

{-
 - By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can
 - see that the 6th prime is 13.
 -
 - What is the 10 001st prime number?
 -}
solve :: String
solve = show $ solveProblem 10001

primes = 2 : filter isPrime [3,5 ..]

isPrime n = noPrimeDivisors n primes
  where
    noPrimeDivisors n (k:ks)
      | n `mod` k == 0 = False
      | k * k > n = True
      | otherwise = noPrimeDivisors n ks

solveProblem n = primes !! (n - 1)
