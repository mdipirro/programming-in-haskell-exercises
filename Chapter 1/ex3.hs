product :: [Int] -> Int
product = foldl (*) 1

product' :: [Int] -> Int
product' = foldr (*) 1
