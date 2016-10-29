data Tree = Leaf Int | Node Tree Tree
            deriving Show

balance :: [Int] -> Tree
balance [x] = Leaf x
balance xs  = Node (balance first) (balance last)
                  where (first, last) = splitAt (length xs `div` 2) xs
