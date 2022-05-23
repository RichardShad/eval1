type clojure = { f : expr list -> expr; args : expr list; req : int; name : string}
and 
  expr = 
  App of expr * expr
  | Abstr of string * expr
  | Symbol of string
  | Int of int
  | Cloj of clojure

let empty = function
[] -> true
| _ -> false 

let app (e1 : expr) (e2 : expr) = App (e1, e2)

let abstr (id : string) (e : expr) = Abstr (id, e)

let symbol (s : string) = Symbol s

let int (i : int) = Int i

let cloj (clj : clojure) = Cloj clj

let rec string_of_expr = function
  | App (e1, e2) -> Printf.sprintf "(%s %s)" (string_of_expr e1) (string_of_expr e2)
  | Abstr (id, e) -> Printf.sprintf "(λ%s . %s)" id (string_of_expr e)
  | Symbol s -> s
  | Int i -> string_of_int i
  | Cloj clj -> if empty clj.args then clj.name 
  else Printf.sprintf "(%s %s)" clj.name (String.concat " " @@ List.map string_of_expr clj.args)
