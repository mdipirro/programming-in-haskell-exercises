dec2int :: [Int] -> Int
dec2int = foldl (\x v -> 10 * x + v) 0
