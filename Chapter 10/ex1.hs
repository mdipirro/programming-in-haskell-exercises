data Nat =  Zero | Succ Nat
            deriving Show

add :: Nat -> Nat -> Nat
add Zero m    = m
add (Succ m) n  = Succ (add m n)

molt :: Nat -> Nat -> Nat
molt Zero _     = Zero
molt (Succ m) n = add n (molt m n)
