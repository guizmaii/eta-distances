module DistancesAPI where

import Prelude hiding (length)
import qualified Data.Map.Strict as Map
import Data.Function ((&))

data LatLong = LatLong { latitude :: Double, longitude :: Double }
  deriving (Show, Eq)

data Distance = Distance { length :: Double, duration :: Double }
  deriving Show

zero :: Distance
zero = Distance { length = 0, duration = 0 }

data TravelMode = Driving | Bicycling | Unknown
  deriving (Show, Ord, Eq)

data DirectedPath = DirectedPath { origin :: LatLong
                                 , destination :: LatLong
                                 , travelModes :: [TravelMode] }
  deriving Show

-- TODO: Implement it. Dumb for now.
distanceProvider :: LatLong -> LatLong -> TravelMode -> IO (TravelMode, Distance)
distanceProvider _ _ travelMode = pure (travelMode, Distance { length = 3, duration = 4 })

-- TODO: I don't understand why I need to write `Map.Map` in the type signature.
distance :: LatLong -> LatLong -> [TravelMode] -> IO (Map.Map TravelMode Distance)
distance _ _ []                         = pure Map.empty
distance origin destination travelModes =
  let
    distancesPairs =
      if origin == destination then
        pure (travelModes & fmap (\x -> (x, zero)))
      else
        travelModes & traverse (distanceProvider origin destination)
  in
    distancesPairs & fmap Map.fromList
