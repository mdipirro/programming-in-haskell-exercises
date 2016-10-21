shift :: Int -> Char -> Char
shift n c | isLower c = int2low ((low2int c + n) `mod` 26)
          | isUpper c = int2upp ((upp2int c + n) `mod` 26)

freqs :: String -> [Float]
freqs xs =  [percent (count x xs') n | x <- ['a'..'z']]
            where xs' = map toLower xs
                  n   = letters xs

low2int :: Char -> Int
low2int c = ord c - ord 'a'

int2low :: Int -> Char
int2low n = chr (ord 'a' + n)

upp2int :: Char -> Int
upp2int c = ord c - ord 'A'

int2upp :: Int -> Char
int2upp n = chr (ord 'A' + n)

letters :: String -> Int
letters xs = length [x | x <- xs, isAlpha x]
