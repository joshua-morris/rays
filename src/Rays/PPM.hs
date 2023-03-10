module Rays.PPM 
    ( savePPM
    , makePPM 
    , Image
    ) where

import Rays.Types
import Linear

type Image = [[Vec3]]

savePPM :: FilePath -> Image -> IO ()
savePPM fp css = writeFile fp $ makePPM css

makePPM :: Image -> String
makePPM css =
  "P3\n" ++ (show $ length $ head css) ++ " " ++ (show $ length css) ++ "\n255\n" ++
  (unlines $ map unwords $ group 3 $ map show $ concatMap colour $ concat css)

group _ [] = []
group n xs =
  let (xs0,xs1) = splitAt n xs
  in  xs0 : group n xs1

colour (V3 r g b) = [channel r, channel g, channel b]

channel :: Float -> Int
channel = floor . (255*) . min 1 . max 0