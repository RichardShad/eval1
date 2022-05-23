open Ast

module Context = Map.Make (String)

type status = expr option

type context_t = status Context.t

let wrap_int_op (op : int -> int -> int) (name : string) (ctx : context_t) : context_t =
  Context.add name (Some (cloj {f=(function [Int i1; Int i2] -> int @@ op i1 i2| _ -> failwith "Wrong arguments!"); 
  name; req=2; args=[]})) ctx

let built_in : context_t = Context.empty |> wrap_int_op (+) "+"

let scope (ctx : context_t) (s : string) =
  if Context.mem s ctx then Context.find s ctx else None

let rec eval (ctx : context_t) (e : expr) : expr =
let rec 
app_clj ({f; req; args; name=_} as clj) (e : expr) = let args' = e::args in
if List.length args' = req then f args' else cloj {clj with args=args'}
and 
handle_apply (e1 : expr) (e2 : expr) : expr = (match e1 with
| Abstr (id, e) -> eval (Context.add id (Some e2) ctx) e
| Cloj clj -> (match e2 with
  | Symbol s -> (match scope ctx s with
    | Some e -> app_clj clj e
    | None -> app e1 e2)
  | _ -> app_clj clj e2)
| _ -> app e1 e2)
in 
match e with 
  App (e1, e2) -> handle_apply (eval ctx e1) (eval ctx e2)
| Abstr (id, e) -> abstr id @@ eval (Context.add id None ctx) e
| Symbol s -> Option.value ~default:e (scope ctx s)
| d -> d
