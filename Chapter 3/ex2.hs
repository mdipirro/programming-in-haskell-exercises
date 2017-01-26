bools :: [Bool]
bools = repeat True

nums :: [[Int]]
nums = replicate 5 [1]

add :: Int -> Int -> Int -> Int
add a b c = a + b + c

copy :: a -> (a, a)
copy a = (a, a)

apply :: (a -> b) -> a -> b
apply f a = f a
