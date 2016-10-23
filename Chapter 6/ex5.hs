merge :: Ord a => [a] -> [a] -> [a]
merge [] ys         = ys
merge xs []         = xs
merge (x:xs) (y:ys) | x <= y    = x : merge xs (y : ys)
                    | otherwise = y : merge (x : xs) ys

mergesort :: Ord a => [a] -> [a]
mergesort []        = []
mergesort xs        = merge half1 half2
                      where n     = length xs `div` 2
                            half1 = mergesort (take n xs)
                            half2 = mergesort (drop n xs)
