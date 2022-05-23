open Ast
open Eval

let parse s = 
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast

  (* {} (lambda x . lambda y . plus x y) 1 2 => {x:1} lambda y. (plus x y) => {x:1 y:2} => (plus x y) *)
let () = "(lambda x . lambda y. lambda z. + x y) 1 2" |> parse |> eval built_in |> string_of_expr |> print_endline
