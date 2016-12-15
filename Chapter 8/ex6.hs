import Parser

term :: Parser Int
term = do f <- factor
          do  symbol "*"
              t <- Main.term
              return (f * t)
              <|>
              do  symbol "/"
                  t <- Main.term
                  return (f `div` t)
                  <|> return f

expr :: Parser Int
expr = do t <- Main.term
          do  o <- token (sat (\o -> o == '+' || o == '-'))
              e <- Main.expr
              if o == '+'
              then return (t + e)
              else return (t - e)
              <|> return t
