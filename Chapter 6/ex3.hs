-- a
and :: [Bool] -> Bool
and []      = True
and (x:xs)  | not x     = False
            | otherwise = x && Main.and xs

-- b
concat :: [[a]] -> [a]
concat [] = []
concat (xs:xss) = xs ++ Main.concat xss

-- c
replicate :: Int -> a -> [a]
replicate 0 _ = []
replicate n a = a : Main.replicate (n - 1) a

-- d
(!!) :: [a] -> Int -> a
(!!) [] _     = error "List too short"
(!!) (x:_) 0 = x
(!!) (_:xs) n = xs Main.!! (n - 1)

-- e
elem :: Eq a => a -> [a] -> Bool
elem _ []     = False
elem a (x:xs) | a == x    = True
              | otherwise = Main.elem a xs
