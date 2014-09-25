module Main where

import Criterion.Main

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib 2 = 1
fib n = fib (n - 1) + fib (n - 2)

main::IO()
main = defaultMain [
  bgroup "fib" [ bench "30" $ whnf fib 30
               , bench "31" $ whnf fib 31
               , bench "32" $ whnf fib 32
               ]
  ]