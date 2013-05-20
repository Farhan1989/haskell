module ProjectEuler.Prime
( test
, primes
, factors
, sigma
) where

import Data.List (group)

-- Tests whether a given integer is prime or not
test n = trialDivisionTest n 2

trialDivisionTest n k | n `mod` k == 0 = False
                      | k*k > n        = True
                      | otherwise      = trialDivisionTest n (k+1)


{-
 - This primes sieve was taken from Richard Bird's implementation of the
 - Sieve of Eratosthenes, as declared in the epilogue of Melissa O'Neill's
 - article "The Genuine Sieve of Eratosthenes" in J. Functional Programming.
 -}
primes = 2:minus [3,5..] composites
    where composites = union [ multiples p | p <- primes ]
multiples n = map (n*) [n..]

-- "minus X Y" removes all elements of y from x
minus (x:xs) (y:ys) | x<y  = x:minus xs     (y:ys)
                    | x==y =   minus xs     ys
                    | x>y  =   minus (x:xs) ys

union = foldr merge []
    where merge (x:xs) ys = x:merge' xs ys
          merge' (x:xs) (y:ys) | x < y  = x:merge' xs (y:ys)
                               | x == y = x:merge' xs ys
                               | x > y  = y:merge' (x:xs) ys


-- Returns a list of the factors of n
factors n = factors' n primes
    where factors' n (p:ps) | n `mod` p == 0 = p:factors' (n `quot` p) (p:ps)
                            | p*p > n        = if n > 1 then [n] else []
                            | otherwise      = factors' n ps


factorsBin n = let fs = factors n
                   -- fs_grouped will be a list of grouped factors
                   -- fs == [5, 3, 3, 3, 2, 2]
                   -- --> fs_grouped = [ [5], [3,3,3], [2,2] ]
                   fs_grouped = group fs
               in [ (head g, length g) | g <- fs_grouped ]


-- The DivisorSigma function. sigma k n = sum [ d^k, n `mod` d == 0 ]
sigma 0 n = let fs_bin = factorsBin n in product [ e+1 | (_,e) <- fs_bin ]
sigma k n = let fs_bin = factorsBin n
            in product [ (r^(e+1)-1) `quot` (r-1) | (p,e) <- fs_bin, let r = p^k ]

-- just for testing purposes
sigma0BruteForce n = length [ d | d <- [1..n], n `mod` d == 0 ]
