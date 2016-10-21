pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x, y, z) | x <- numbers, y <- numbers, z <- numbers, x ^2 + y ^ 2 == z ^ 2]
          where numbers = [1..n]
