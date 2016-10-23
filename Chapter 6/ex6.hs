-- sum
sum :: Num a => [a] -> a
sum []      = 0
sum (x:xs)  = x + Main.sum xs

-- take
take :: Int -> [a] -> [a]
take _ []     = []
take 0 _      = []
take n (x:xs) = x : Main.take (n - 1) xs

--last
last :: [a] -> a
last [x]      = x
last (x:xs)   = Main.last xs
