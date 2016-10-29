data Tree = Leaf Int | Node Tree Int Tree
            deriving Show

occurs :: Int -> Tree -> Bool
occurs m (Leaf i)     = m == i
occurs m (Node l i r) = case compare m i of
                        LT -> occurs m l
                        EQ -> True
                        GT -> occurs m r

-- This definition is more efficient because it requires only a comparison. The
--previous definition might require two.
