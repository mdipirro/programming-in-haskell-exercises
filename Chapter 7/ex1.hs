g :: (a -> b) -> (a -> Bool) -> [a] -> [b]
g f p xs = [f x | x <- xs, p x]

g' :: (a -> b) -> (a -> Bool) -> [a] -> [b]
g' _ _ [] = []
g' f p xs = map f (filter p xs)
