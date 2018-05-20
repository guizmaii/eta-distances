module DistancesAPI where

import Prelude hiding (length)

data LatLong    = LatLong { latitude :: Double, longitude :: Double }
  deriving Show

data Distance   = Distance { length :: Double, duration :: Double }
  deriving Show

data TravelMode = Driving | Bicycling | Unknown
  deriving Show

-- TODO: Implement it. Dumb for now.
distanceProvider :: LatLong -> LatLong -> TravelMode -> IO (TravelMode, Distance)
distanceProvider _ _ travelMode = pure (travelMode, Distance { length = 3, duration = 4 })

distance :: LatLong -> LatLong -> [TravelMode] -> IO [(TravelMode, Distance)]
distance origin destination travelModes =
  let configuredDistanceProvider = distanceProvider origin destination
  in traverse configuredDistanceProvider travelModes