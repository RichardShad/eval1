{
    open Parser
}

let white = [' ' '\t' '\n']+
let alpha = ['a'-'z' 'A'-'Z']
let digit = ['0'-'9']
let int = '-'? digit+

let ident = "+" | "-" | alpha (alpha | digit | "_" | "-")* 

rule read = 
    parse
    | white { read lexbuf }
    | "lambda" { LAMBDA }
    | int as i { INT (int_of_string i) }
    | ident as id { IDENTITY id }
    | "(" { LPARAN }
    | ")" { RPARAN }
    | "." { DOT }
    | eof { EOF }