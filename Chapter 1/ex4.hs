qsort :: Ord a => [a] -> [a]
qsort []      = []
qsort (x:xs)  = qsort larger ++ [x] ++ qsort smaller
                where smaller = [x' | x' <- xs, x' <= x]
                      larger  = [x' | x' <- xs, x' > x]
