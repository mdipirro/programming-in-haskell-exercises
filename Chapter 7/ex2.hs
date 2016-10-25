all' :: (a -> Bool) -> [a] -> Bool
all' p xs = length (filter p xs ) == length xs

any' :: (a -> Bool) -> [a] -> Bool
any' p xs = length (filter p xs) > 0

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ []     = []
takeWhile' p (x:xs) | p x       = x : takeWhile' p xs
                    | otherwise = []

dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' _ []     = []
dropWhile' p (x:xs) | p x       = x:xs
                    | otherwise = dropWhile' p xs
