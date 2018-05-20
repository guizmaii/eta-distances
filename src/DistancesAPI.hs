module DistancesAPI where

import Prelude hiding (length)
import qualified Data.Map.Strict as Map

data LatLong    = LatLong { latitude :: Double, longitude :: Double }
  deriving Show

data Distance   = Distance { length :: Double, duration :: Double }
  deriving Show

data TravelMode = Driving | Bicycling | Unknown
  deriving (Show, Ord, Eq)

-- TODO: Implement it. Dumb for now.
distanceProvider :: LatLong -> LatLong -> TravelMode -> IO (TravelMode, Distance)
distanceProvider _ _ travelMode = pure (travelMode, Distance { length = 3, duration = 4 })

-- TODO: I don't understand why I need to write `Map.Map` in the type signature.
distance :: LatLong -> LatLong -> [TravelMode] -> IO (Map.Map TravelMode Distance)
distance origin destination travelModes =
  let
    configuredDistanceProvider = distanceProvider origin destination
    distancesPairs = traverse configuredDistanceProvider travelModes
  in
    fmap Map.fromList distancesPairs