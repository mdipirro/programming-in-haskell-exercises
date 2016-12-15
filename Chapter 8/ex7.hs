import Parser

{-|
factor ::= base ^ factor | base
base ::= (expr) | nat
-}

factor :: Parser Int
factor = do   b <- base
              do  symbol "^"
                  f <- Main.factor
                  return (b ^ f)
                  <|> return b

base :: Parser Int
base =  do  symbol "("
            e <- expr
            symbol ")"
            return e
        <|> nat
