find :: Eq a => a -> [(a, b)] -> [b]
find k ps = [v | (k', v) <- ps, k == k']

positions :: Eq a => a -> [a] -> [Int]
positions x xs = find x (zip xs [1..length xs])
