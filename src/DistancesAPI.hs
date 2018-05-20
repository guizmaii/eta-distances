module DistancesAPI where

import Prelude hiding (length)

data LatLong  = LatLong { latitude :: Double, longitude :: Double }
data Distance = Distance { length :: Double, duration :: Double }

instance Show Distance where
  show (Distance o d) = "Distance( length = " ++ show o ++ ", duration = " ++ show d ++ " )"

distance :: LatLong -> LatLong -> IO Distance
distance origin destination = pure Distance { length = 3, duration = 4 }