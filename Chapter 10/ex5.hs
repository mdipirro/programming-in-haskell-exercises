data Prop = Const Bool
          | Var Char
          | Not Prop
          | And Prop Prop
          | Imply Prop Prop
          | Or Prop Prop
          | Iff Prop Prop

{-|
Given a proposition F, the function `vars` returns the list of the distinct
variables contained in F. Thus, if we consider as an example the proposition
Imply ( (And 'A' (Imply 'A' 'B')) 'B')
`vars` must return ['A', 'B']. The list must be obtained by analizing the
proposition left-to-right (the value ['B', 'A'] as a result for the above
proposition is wrong).
-}
vars :: Prop -> [Char]
vars (Const _)      = []
vars (Var v)        = [v]
vars (Not p)        = vars p
vars (And p1 p2)    = merge (vars p1) (vars p2)
vars (Imply p1 p2)  = merge (vars p1) (vars p2)
vars (Or p1 p2)     = merge (vars p1) (vars p2)
vars (Iff p1 p2)    = merge (vars p1) (vars p2)

{-|
The function `merge` merges two lists `xs` and `ys` (possibly with duplicates),
and returns the list `xs++ys'`, where ys' is ys without the elements contained
in xs.
-}
merge :: [Char] -> [Char] -> [Char]
merge xs []     = xs
merge xs (y:ys) = if elem y xs
                  then merge xs ys
                  else merge (xs ++ [y]) ys

{-|
Given a list of chars, which represents a list of propositional variables, `ttables`
produces a list with every possible association between the name of the variable
and the logical value (True or False). For example, if the list is ['A', 'B'],
the list
[[('A',True), ('B',True)],
[('A',True),('B',False)],
[('A',False),('B',True)],
[('A',False),('B',False]]
-}
ttables :: [Char] -> [[(Char, Bool)]]
ttables vs =  map (zip vs) (generateBooleanValues (length vs))
              where generateBooleanValues 0 = [[]]
                    generateBooleanValues n = map (True :) bss ++ map (False :) bss
                                              where bss = generateBooleanValues (n - 1)

{-|
Given a proposition, `solutions` considers every possible substituition of the
variables in the proposition and return True iff the proposition is true for
each configuration (we say that the proposition is a tautology).
-}
solutions :: Prop -> [[(Char, Bool)]] -> Bool
solutions p = foldl (evaluate.&&) True
--and [evaluate p t | t <- ts] this is using list comprehension
                  where evaluate (Const b) _      = b
                        evaluate (Var v) ts       = find v ts
                                                    where find _ [] = False
                                                          find v ((c, b):ts)  | v == c    = b
                                                                              |otherwise  = find v ts
                        evaluate (Not p) ts       = not (evaluate p ts)
                        evaluate (And p1 p2) ts   = (evaluate p1 ts) && (evaluate p2 ts)
                        evaluate (Imply p1 p2) ts = if (not (evaluate p1 ts))
                                                    then True
                                                    else evaluate p2 ts
                        evaluate (Or p1 p2) ts    = (evaluate p1 ts) || (evaluate p2 ts)
                        evaluate (Iff p1 p2) ts   = (evaluate p1 ts) == (evaluate p2 ts)
