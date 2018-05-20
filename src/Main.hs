module Main where

import DistancesAPI
import Data.Function ((&))

main :: IO ()
main = let
         origin      = LatLong { latitude = 2, longitude = 2 }
         destination = LatLong { latitude = 3, longitude = 3 }
         d           = distance origin destination [Driving, Bicycling]
       in
         d & fmap show >>= putStrLn
