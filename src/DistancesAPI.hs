module DistancesAPI where

import Prelude hiding (length)

data LatLong    = LatLong { latitude :: Double, longitude :: Double }
data Distance   = Distance { length :: Double, duration :: Double }
data TravelMode = Driving | Bicycling | Unknown

instance Show Distance where
  show (Distance o d) = "Distance( length = " ++ show o ++ ", duration = " ++ show d ++ " )"

-- [TravelMode] -> (TravelMode -> LatLong -> LatLong -> IO Distance) -> [IO Distance] -> IO [Distance]

-- TODO: Implement it. Dumb for now.
distanceProvider :: LatLong -> LatLong -> TravelMode -> IO Distance
distanceProvider _ _ _ = pure Distance { length = 3, duration = 4 }

distance :: LatLong -> LatLong -> [TravelMode] -> IO [Distance]
distance origin destination travelModes =
  let configuredDistanceProvider = distanceProvider origin destination
  in traverse configuredDistanceProvider travelModes