module Solutions where

import Prelude hiding (Semigroup (..), Monoid(..), Functor(..))
import Data.Kind (Constraint, Type)

data NonEmpty a = a :| [a]
  deriving (Show, Eq, Ord)

class Semigroup a where
  (<>) :: a -> a -> a

  sconcat :: NonEmpty a -> a
  sconcat (x :| []) = x
  sconcat (x :| (y:ys)) = x <> sconcat (y :| ys)

  stimes :: Integral b => b -> a -> a
  stimes n a
    | toInteger n <= 0 = undefined
    | otherwise = sconcat $
      a :| replicate (fromInteger $ toInteger $ n - 1) a

class Semigroup a => Monoid a where
  mempty :: a

  mappend :: a -> a -> a
  mappend = (<>)

  mconcat :: [a] -> a
  mconcat = foldl mappend mempty

instance Semigroup a => Semigroup (Maybe a) where
  Just x <> Just y = Just $ x <> y
  Just x <> _ = Just x
  _ <> Just y = Just y
  _ <> _ = Nothing

instance Semigroup a => Monoid (Maybe a) where
  mempty = Nothing

newtype Predicate a = Predicate (a -> Bool)

-- &&
instance Semigroup (Predicate a) where
  Predicate p1 <> Predicate p2
    = Predicate $ \x -> p1 x && p2 x

instance Monoid (Predicate a) where
  mempty = Predicate $ const True

data BinTree a = Empty | Node a (BinTree a) (BinTree a)
  deriving (Show, Eq, Ord)

-- (a -> b) -> [a] -> [b]

listMap :: (a -> b) -> [] a -> [] b
listMap = map

treeMap :: (a -> b) -> BinTree a -> BinTree b
treeMap _ Empty = Empty
treeMap f (Node root left right)
  = Node (f root) (treeMap f left) (treeMap f right)

maybeMap :: (a -> b) -> Maybe a -> Maybe b
maybeMap _ Nothing = Nothing
maybeMap f (Just x) = Just $ f x

-- type Functor :: (Type -> Type) -> Constraint
-- class Functor (f :: Type -> Type) where

-- [], [] a
class Functor f where
  fmap :: (b -> c) -> f b -> f c

instance Functor [] where
  fmap = map

instance Functor BinTree where
  fmap = treeMap

-- Either, (,)

instance Functor (Either a) where
  -- fmap :: (b -> c) -> Either a b -> Either a c
  fmap _ (Left x) = Left x
  fmap f (Right y) = Right $ f y

-- за домашно 1: може ли да бъде фуктор в първия си аргумент?
instance Functor ((,) a) where
  fmap f (x,y) = (x, f y)

-- (->) a == a -> _

-- за домашно 2: може ли да бъде фуктор в първия си агргумент?
instance Functor ((->) a) where
  -- fmap :: (b -> c) -> (a -> b) -> (a -> c)
  fmap = (.)

-- за домашно 3: да се докаже, че [] и Maybe са функтори

add1 :: (->) Int Int
add1 = undefined
