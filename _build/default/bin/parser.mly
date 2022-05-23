%token LPARAN
%token RPARAN
%token DOT
%token LAMBDA
%token <string> IDENTITY
%token <int> INT
%token EOF

%start <Ast.expr> prog

%% 

prog: expr; EOF { $1 }

let term == 
    | i = INT; { Ast.int i }
    | s = IDENTITY; {Ast.symbol s}

let sub_expr :=
    | term
    | LPARAN; e = expr; RPARAN; { e }

let abstr :=
    | LAMBDA; p = IDENTITY; DOT; b = expr; { Ast.abstr p b }

let app :=
    | sub_expr
    | h = app; a = sub_expr; { Ast.app h a }

let expr :=
    | abstr
    | app