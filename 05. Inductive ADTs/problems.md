# Задачи

## Задача 01

Да се дефинира алгебричен тип данни, представящ естествените числа
в Пеановата аритметика. Да се дефинират следните функции:

- `succ :: Nat -> Nat`;
- `pred :: Nat -> Nat`;
- `evenNat :: Nat -> Bool`;
- `add :: Nat -> Nat -> Nat`;
- `mult :: Nat -> Nat -> Nat`.
- `fromInt :: Int -> Nat`;
- `toInt :: Nat -> Int`;
- `cmp :: Nat -> Nat -> Ordering`.

## Задача 02

Да се дефинира алгебричен тип данни, представящ списък от елементи
от произволен тип. Да се дефинират следните функции:

- `isEmpty :: List a -> Bool`;
- `headList :: List a -> Maybe a`;
- `singleton :: a -> List a`;
- `(+++) :: List a -> List a -> List a`, който конкатенира два списъка;
- `reverseList :: List a -> List a`;
- `fromList :: [a] -> List a`;
- `toList :: List a -> [a]`;
- `mapList :: (a -> b) -> List a -> List b`;
- `intersperse :: a -> List a -> List a`.

## Задача 03

Да се дефинира алгебричен тип данни, представящ дърво с произволен брой наследници.
Да се дефинират следните функции:

- `countNodes :: Tree a -> Int`;
- `countLeaves :: Tree a -> Int`;
- `contains :: Eq a => a -> Tree a -> Bool`;
- `flatten :: Tree a -> [a]`.

## Задача 04

Да се дефинира алгебричен тип данни, представящ двоично дърво с елементи от произволен тип.
Да се дефинират следните функции:

- `countLeaves :: BinTree a -> Int`;
- `height :: BinTree a -> Int`;
- `mapBT :: (a -> b) -> BinTree a -> BinTree b`;
- `inorder :: BinTree a -> [a]`;
- `preorder :: BinTree a -> [a]`;
- `toBST :: Ord a => [a] -> BinTree a`;
- `isBalancedBST :: (Ord a, Bounded a) => BinTree a -> Bool`;
- `kthSmallest :: Ord a => Int -> BinTree a -> Maybe a`;
- `path :: Eq a => a -> BinTree a -> [a]`;
- `paths :: a -> BinTree a -> [[a]]`.

## Задача 05 - контролно по ФП на КН2, 2024/2025г.

Да се дефинира функция, която приема двоично дърво и връща максималната дължина
на път в дървото, в който произведението на нечетните елементи е минимално.

## Задача 06

Да се дефинира безкрайно двоично дърво от всички естествени
числа, подредени по следния начин:

```
     1
   /   \
  2     3
 / \   / \
4   5 6   7
...
```

## Задача 07

Да се дефинира безкрайно двоично дърво, което генерира всички възможни
числа от редицата на Колац.

## Задача 08

Нека е дадена следният индуктивен алгебричен тип данни, представящ
израз, който се оценява до стойност от числен тип:

```hs
data Expr a
  = Constant a
  | Variable String
  | Expr a :+: Expr a
  | Expr a :*: Expr a
  deriving (Show, Eq, Ord)
```

Използвайки ваш АТД за речник, дефинирайте функция, която оценява
такъв израз, като оценката на променлива `var` се замества със стойността `value`
на двойката ключ-стойност `(var, value)` в речника. Ако такава няма,
то няма как изразът да бъде оценен.

- `eval :: Num a => Dict String a -> Expr a -> Maybe a`

Пример:

```hs
dict :: Dict String Int
dict = fromList [("x",1), ("y", 2)]

expr1 :: Expr Int
expr1 = Variable "x" :+: (Variable "y" :*: Constant 3)

expr2 :: Expr Int
expr2 = Constant 2 :*: Variable "z"

-- >>> eval dict expr1
-- Just 7

-- >>> eval dict expr2
-- Nothing
```
