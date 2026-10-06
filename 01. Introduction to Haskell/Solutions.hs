module Solutions where
import GHC.HeapView (ClosureType(CONSTR_0_1))

-- 01. Какво е ФП и защо го учим?
-- 02. Какво е специфично за езика Haskell?
-- 03. Къде и как ще пишем Haskell?
-- 04. Накратко за GHCi

-- 05. Основни типове

-- Int, Integer, Bool, Float, Double, Char, String, [Int]
-- [[Bool]]

-- String == [Char]

-- (Int, Char), (Int, Char, Float)

c :: Char
c = 'б'

-- 06. Дефиниране на константи

x :: Int
x = 42 + 90

-- 07. Дефиниране на функции

add :: Num a => a -> a -> a
add x y = x + y

-- 08. Условни конструкции

-- if/else
-- case of
-- guards
    -- | x < 0 = ...
-- pattern matching

isZero :: Int -> Bool
isZero x = if x == 0 then True else False

isZero2 :: Int -> Bool
isZero2 x
    | x == 0 = True  -- if
    | x == 1 = False
    | otherwise = False -- else
    
-- pattern matching
isZero3 :: Int -> Bool
isZero3 0 = True
isZero3 _ = False

-- case of
isZero4 :: Int -> Bool
isZero4 x = case x of
    0 -> True
    _ -> False

-- 09. Напасване на образци (pattern matching)

-- 10. Грешки

-- undefined, error

divide :: Int -> Int -> Int
divide x 0 = error "cannot divide by 0"
divide 0 y = 0
divide x y = x `div` y

-- 11. Примитивна и опашкова рекурсия

-- Примитивна рекурсия
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- опашкова рекурсия
factorialHelper :: Int -> Int -> Int
factorialHelper 0 acc = acc
factorialHelper n acc = factorialHelper (n - 1) (n * acc)

factorialTail :: Int -> Int
factorialTail n = factorialHelper n 1

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

fibTailHelper :: Int -> Int -> Int -> Int
fibTailHelper 0 prev curr = prev
fibTailHelper n prev curr = fibTailHelper (n - 1) curr (prev + curr)

fibTail :: Int -> Int
fibTail n = fibTailHelper n 0 1

-- 12. Локални дефиниции - let, where

factTail :: Int -> Int
factTail n =
  -- в let можем да дефинираме и константи, и функции
  let helper 0 acc = acc
      helper m acc = helper (m - 1) (m * acc)
    in helper n 1

-- where клаузи
factTail2 :: Int -> Int
factTail2 n = helper n 1
  where
    x :: Int
    x = 3

    y = 10

    helper :: Int -> Int -> Int
    helper 0 acc = acc
    helper m acc = helper (m - 1) (m * acc)
