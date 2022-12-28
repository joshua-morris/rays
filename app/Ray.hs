module Ray where

import Vec3

data Ray = Ray { orig, dir :: Vec3 Double } deriving (Eq, Show)

rayAt :: Ray -> Double -> Vec3 Double
rayAt (Ray orig dir) t = orig + vscale t dir

lerp :: Double -> Vec3 Double -> Vec3 Double -> Vec3 Double
lerp t u v = vscale (1-t) u + vscale t v