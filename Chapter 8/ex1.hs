import Parser

int :: Parser Int
int =   do  char '-'
            n <- nat
            return (-n)
        <|> nat
