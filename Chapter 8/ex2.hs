import Parser

comment :: Parser ()
comment = do  symbol "--"
              many (sat (/='\n'))
              char '\n'
              return ()
