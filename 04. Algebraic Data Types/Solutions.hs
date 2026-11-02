module Solutions where
import Data.List (partition)
import Data.Function (on)

-- enum
-- enum class Season { WINTER, ... }

-- сума на типове
data Season = Winter | Autumn | Spring | Summer
  deriving (Show, Eq, Ord, Enum)

-- Num, Fractional

-- show

season :: Season
season = Autumn

seasonToString :: Season -> String
seasonToString (Winter) = "winter"
seasonToString Autumn = "autumn"
seasonToString Spring = "spring"
seasonToString Summer = "summer"

-- data Bool = True | False

-- struct Person

-- отляво: конструктор на типове
-- отдясно: конструктор на данни
data Person = PersonWithAge String Int | Person String
  deriving (Show, Eq, Ord)

data Person' where
  PersonWithAge' :: String -> Int -> Person'
  Person' :: String -> Person'

-- |Person| = |String|.|Int| + |String|

-- show :: Person -> String

-- произведение на типове
data Foo = Foo Bool Season

data Void

data Unit = Unit

div :: Double -> Double -> Double
div x 0 = undefined
div x y = x / y

safeDiv :: Double -> Double -> Maybe' Double
safeDiv x 0 = Nothing'
safeDiv x y = Just' (x / y)

data Maybe' a = Nothing' | Just' a

-- |Maybe'| = 1 + |a|

-- Person "Pesho" 67

-- * я четем като Type

foo :: Int -> Maybe Int
foo = undefined

-- f :: a -> b
-- x :: a
-- f x :: b

-- constructor :: * -> *
-- type :: *
-- constructor type :: *
-- Maybe Double :: *

data Either' a b = Left' a | Right' b
  deriving (Show, Eq, Ord)

-- |Either| = |a| + |b|

safeDivEither :: Double -> Double -> Either' String Double
safeDivEither x 0 = Left' "cannot divide by 0"
safeDivEither x y = Right' (x / y)

-- record syntax, where syntax, newtype

data Student = Student String String

nameStudent :: Student -> String
nameStudent (Student name _) = name

data Song = Song
  { title :: String
  , artist :: String
  , album :: String
  , duration :: Int
  , likes :: Int
  }

-- title :: Song -> String

song :: Song
song = Song
  { title = "never gonna give you up"
  , artist = "rick"
  , album = "album"
  , duration = 532
  , likes = 10000000}

type Playlist = [Song]

newtype Fahrenheit = Fahrenheit Double
newtype Celcius = Celcius Double

addFahrenheit :: Fahrenheit -> Fahrenheit -> Fahrenheit
addFahrenheit (Fahrenheit x) (Fahrenheit y) = Fahrenheit $ x + y

f1 :: Fahrenheit
f1 = Fahrenheit 100

c1 :: Celcius
c1 = Celcius 30

data Ordering' = LessThan | Equal | GreaterThan
  deriving (Show, Eq, Ord, Enum)

cmpInt :: Int -> Int -> Ordering'
cmpInt x y
  | x < y = LessThan
  | x == y = Equal
  | otherwise = GreaterThan

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

perimeter :: Shape -> Double
perimeter (Square x) = 4 * x
perimeter (Triangle a b c) = a + b + c
perimeter (Polygon n x) = fromIntegral n * x

sortBy :: (a -> a -> Ordering) -> [a] -> [a]
sortBy _ [] = []
sortBy cmp (pivot:xs) = sortBy cmp lte ++ [pivot] ++ sortBy cmp gt
  where
    (lte, gt) = partition ((/= GT). (`cmp` pivot)) xs

-- sortBy + on + compare

sortShapes :: [Shape] -> [Shape]
sortShapes = sortBy (compare `on` perimeter)

-- on :: (b -> b -> c) -> (a -> b) -> a -> a -> c
-- a ~ Shape
-- b ~ Double
-- c ~ Ordering
