open Ast

type context_t

val built_in : context_t

val eval : context_t -> expr -> expr