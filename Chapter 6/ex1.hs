(^) :: Int -> Int -> Int
(^) x 0 = 1
(^) x (y + 1) = x * (x ^ y)
