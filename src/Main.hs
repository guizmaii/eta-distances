module Main where

import DistancesAPI

main :: IO ()
main = fmap show distance >>= putStrLn
