module DistancesAPI where

import Prelude hiding (length)

data LatLong  = LatLong { origin :: Double, destination :: Double }
data Distance = Distance { length :: Double, duration :: Double }

instance Show Distance where
  show (Distance o d) = "Distance( length = " ++ show o ++ ", duration = " ++ show d ++ " )"

distance :: IO Distance
distance = pure Distance { length = 2, duration = 3 }