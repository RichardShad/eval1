
(* The type of tokens. *)

type token = 
  | RPARAN
  | LPARAN
  | LAMBDA
  | INT of (int)
  | IDENTITY of (string)
  | EOF
  | DOT

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr)
