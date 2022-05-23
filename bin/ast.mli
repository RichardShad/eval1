type clojure = { f : expr list -> expr; args : expr list; req : int; name : string}
and expr = 
  App of expr * expr
| Abstr of string * expr
| Symbol of string
| Int of int
| Cloj of clojure

val string_of_expr : expr -> string
val app : expr -> expr -> expr
val abstr : string -> expr -> expr
val symbol : string -> expr
val int : int -> expr
val cloj : clojure -> expr
