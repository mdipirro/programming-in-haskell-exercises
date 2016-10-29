data Tree = Leaf Int | Node Tree Tree

leaves :: Tree -> Int
leaves (Leaf _)   = 1
leaves (Node l r) = leaves l + leaves r

balanced :: Tree -> Bool
balanced (Leaf _) = True
balanced (Node l r) = abs (leaves l - leaves r) <= 1
