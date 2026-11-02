# Задачи

## Задача 01

Да се дефинира алгебричен тип данни, представящ релации на наредба между елементи,
като за два елемента `x` и `y` е вярно, че:

- или `x < y`;
- или `x == y`;
- или `x > y`.

Да се дефинира функция, която сравнява два елемента от целочислен тип
и връща стойност от горния АТД.

```hs
cmpInt :: Int -> Int -> Ordering
```

Пример:

```hs
ghci> cmpInt 1 7
LessThan
ghci> cmpInt 7 7
Equal
ghci> cmpInt 7 1
GreaterThan
```

## Задача 02

Да се дефинира алгебричен тип данни, представящ фигура в равнината,
която може да бъде триъгълник, квадрат или правилен многоъгълник, представена
чрез броя страни, които има, и дължините на тези страни.
Да се дефинират следните функции:

- `perimeter :: Shape -> Double`;
- `numberOfSides :: Shape -> Int`;
- `prettyPrint :: Shape -> String`, където изходът трябва да е в следния формат:

  ```hs
  prettyPrint (Square 4)           ~> "This figure is a square with sides of length 4"
  prettyPrint (Triangle 4.5 1 3.6) ~> "This figure is a triangle with sides 4.5, 1, and 3.6"
  prettyPrint (Polygon 5 6.6)      ~> "This figure is a regular polygon that has 5 sides, each of length 6.6"
  ```

## Задача 03

Да се дефинира алгебричен тип данни, представящ наредена двойка,
където двете компоненти могат да бъдат от произволен тип.
Да се дефинират следните функции:

- `myFst :: Pair a b -> a`;
- `mySnd :: Pair a b -> b`;
- `myRev :: Pair a b -> Pair b a`;
- `pairToTuple :: Pair a b -> (a,b)`;
- `tupleToPair :: (a,b) -> Pair a b`;
- `cmpPair :: (Ord a, Ord b) => Pair a b -> Pair a b -> Ordering`, където `Ordering` е АТД от задача 01;
- `pairsToList :: [Pair a b] -> Pair [a] [b]`.

## Задача 04

Да се дефинира алгебричен тип данни `Maybe`, аналогичен на този,
за който сте говорили на лекции. Да се дефинират следните функции:

- `safeDiv :: Double -> Double -> Maybe Double`;
- `addM :: Maybe Int -> Maybe Int -> Maybe Int`;
- `sumM :: [Maybe Int] -> Maybe Int`;
- `isJust :: Maybe a -> Bool`;
- `isNothing :: Maybe a -> Bool`;
- `fromJust :: Maybe a -> a`;
- `maybe :: b -> (a -> b) -> Maybe a -> b`;
- `safeHead :: [a] -> Maybe a`.

## Задача 05

Да се дефинира тип `Either`, аналогичен на този, за който сте говорили на лекции.
Да се дефинират следните функции:

- `safeDiv :: Double -> Double -> Either String Double`;
- `isLeft :: Either a b -> Bool`;
- `isRight :: Either a b -> Bool`;
- `fromLeft :: Either a b -> a`;
- `fromRight :: Either a b -> b`;
- `either :: (a -> c) -> (b -> c) -> Either a b -> c`;
- `bimap :: (a -> c) -> (b -> d) -> Either a b -> Either c d`;

## Задача 06

Да се дефинира алгебричен тип данни, представящ множество от
елементи от произволен тип. Да се дефинират следните функции:

- `fromList :: [a] -> Set a`;
- `toList :: Set a -> [a]`;
- `insert :: a -> Set a -> Set a`;
- `delete :: a -> Set a -> Set a`;
- `elemS :: a -> Set a -> Bool`;
- `union :: Set a -> Set a -> Set a`;
- `intersect :: Set a -> Set a -> Set a`;
- `equal :: Set a -> Set a -> Bool`.

*Забележка*: Някои от типовете на горните функции са **непълни**.
Допълнете ги по такъв начин, че да се компилират и работят коректно.

## Задача 07

Да се реши задача 13 от миналия път.

## Задача 08

Да се дефинира алгебричен тип данни, представящ естествените числа
в Пеановата аритметика. Да се дефинират следните функции:

- `succ :: Nat -> Nat`;
- `pred :: Nat -> Nat`;
- `add :: Nat -> Nat -> Nat`;
- `mult :: Nat -> Nat -> Nat`.
- `fromInt :: Int -> Nat`;
- `toInt :: Nat -> Int`;
- `cmp :: Nat -> Nat -> Ordering`.

## Задача 09

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
