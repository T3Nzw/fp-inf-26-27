module Solutions where
import Data.Kind (Constraint, Type)

import Prelude hiding (lookup)

type Dict :: (Type -> Type -> Type) -> Constraint
class Dict dict where
  isEmpty :: dict k v -> Bool
  insert :: Ord k => k -> v -> dict k v -> dict k v
  remove :: Ord k => k -> dict k v -> dict k v
  lookup :: Ord k => k -> dict k v -> Maybe v

class Dict dict => DefaultDict dict where
  defaultValue :: dict k v -> v

  lookupDefault :: Ord k => k -> dict k v -> v
  lookupDefault key dict
    = case lookup key dict of
        Just v -> v
        _      -> defaultValue dict

newtype AssocList k v = AssocList [(k,v)]

instance Dict AssocList where
  isEmpty (AssocList kvps) = null kvps

  insert key value (AssocList kvps)
    = AssocList $ (key, value) : filter ((/= key) . fst) kvps

data BST k v
  = Empty
  | Node
    { key :: k
    , value :: v
    , left :: BST k v
    , right :: BST k v
    }

mkLeaf :: k -> v -> BST k v
mkLeaf key value = Node key value Empty Empty

instance Dict BST where
  isEmpty Empty = True
  isEmpty _ = False

  insert key value Empty
    = mkLeaf key value
  insert key value (Node k1 v1 left right)
    | key == k1 = Node k1 value left right
    | key <  k1 = Node k1 v1 (insert key value left) right
    | otherwise = Node k1 v1 left (insert key value right)

-- x:1, y:2; lookup x ~> 1; lookup t ~> -1
