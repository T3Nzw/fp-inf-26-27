module Shape (mkSquare, Shape) where

data Shape
  = Square Double
  | Triangle Double Double Double
  | Polygon Int Double
  deriving (Show, Eq, Ord)

mkSquare :: Double -> Shape
mkSquare x =
  if x <= 0
  then error "cannot create square"
  else Square x
