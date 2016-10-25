`sumsqreven = compose [sum, map (^2), filter even]`

It is invalid because of the types. In fact, the `compose` type signature is
`compose :: [a -> a] -> (a -> a)`, where `a` must be the same in every function.
But the functions' type signatures are:

- `sum :: Num a => [a] -> a`
- `map (^2) :: Num a => [a] -> [a]`
- `filter even :: Integral a => [a] -> [a]`

The type of the value returned from `sum` and those of the values returned by
`map (^2)` and `filter even` are different.
