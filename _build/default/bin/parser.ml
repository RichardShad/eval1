
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | RPARAN
    | LPARAN
    | LAMBDA
    | INT of (
# 6 "bin/parser.mly"
       (int)
# 18 "bin/parser.ml"
  )
    | IDENTITY of (
# 5 "bin/parser.mly"
       (string)
# 23 "bin/parser.ml"
  )
    | EOF
    | DOT
  
end

include MenhirBasics

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_prog) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState01 : (('s, _menhir_box_prog) _menhir_cell1_LPARAN, _menhir_box_prog) _menhir_state
    (** State 01.
        Stack shape : LPARAN.
        Start symbol: prog. *)

  | MenhirState04 : (('s, _menhir_box_prog) _menhir_cell1_LAMBDA _menhir_cell0_IDENTITY, _menhir_box_prog) _menhir_state
    (** State 04.
        Stack shape : LAMBDA IDENTITY.
        Start symbol: prog. *)

  | MenhirState09 : (('s, _menhir_box_prog) _menhir_cell1_app, _menhir_box_prog) _menhir_state
    (** State 09.
        Stack shape : app.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_app = 
  | MenhirCell1_app of 's * ('s, 'r) _menhir_state * (Ast.expr)

and 's _menhir_cell0_IDENTITY = 
  | MenhirCell0_IDENTITY of 's * (
# 5 "bin/parser.mly"
       (string)
# 61 "bin/parser.ml"
)

and ('s, 'r) _menhir_cell1_LAMBDA = 
  | MenhirCell1_LAMBDA of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPARAN = 
  | MenhirCell1_LPARAN of 's * ('s, 'r) _menhir_state

and _menhir_box_prog = 
  | MenhirBox_prog of (Ast.expr) [@@unboxed]

let _menhir_action_01 =
  fun _1 _3 b p ->
    (
# 24 "bin/parser.mly"
                                           ( Ast.abstr p b )
# 78 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_02 =
  fun _1 ->
    (_1 : (Ast.expr))

let _menhir_action_03 =
  fun a h ->
    (
# 28 "bin/parser.mly"
                             ( Ast.app h a )
# 90 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_04 =
  fun _1 ->
    (_1 : (Ast.expr))

let _menhir_action_05 =
  fun _1 ->
    (_1 : (Ast.expr))

let _menhir_action_06 =
  fun _1 ->
    (
# 13 "bin/parser.mly"
                ( _1 )
# 106 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_07 =
  fun i ->
    (
# 16 "bin/parser.mly"
               ( Ast.int i )
# 114 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_08 =
  fun s ->
    (
# 17 "bin/parser.mly"
                    (Ast.symbol s)
# 122 "bin/parser.ml"
     : (Ast.expr))

let _menhir_action_09 =
  fun _1 _3 e ->
    (
# 21 "bin/parser.mly"
                                ( e )
# 130 "bin/parser.ml"
     : (Ast.expr))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | DOT ->
        "DOT"
    | EOF ->
        "EOF"
    | IDENTITY _ ->
        "IDENTITY"
    | INT _ ->
        "INT"
    | LAMBDA ->
        "LAMBDA"
    | LPARAN ->
        "LPARAN"
    | RPARAN ->
        "RPARAN"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_15 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let _1 = _v in
          let _v = _menhir_action_06 _1 in
          MenhirBox_prog _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPARAN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPARAN ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | LAMBDA ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_07 i in
          _menhir_run_07_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IDENTITY _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_08 s in
          _menhir_run_07_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LAMBDA (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENTITY _v ->
          let _menhir_stack = MenhirCell0_IDENTITY (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | DOT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPARAN ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
              | LAMBDA ->
                  _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
              | INT _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_0 in
                  let _v = _menhir_action_07 i in
                  _menhir_run_07_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | IDENTITY _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let s = _v_2 in
                  let _v = _menhir_action_08 s in
                  _menhir_run_07_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_07_spec_04 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LAMBDA _menhir_cell0_IDENTITY -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_02 _1 in
      _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LPARAN ->
          let _menhir_stack = MenhirCell1_app (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | INT _v_0 ->
          let _menhir_stack = MenhirCell1_app (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_0 in
          let _v = _menhir_action_07 i in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IDENTITY _v_2 ->
          let _menhir_stack = MenhirCell1_app (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v_2 in
          let _v = _menhir_action_08 s in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | EOF | RPARAN ->
          let _1 = _v in
          let _v = _menhir_action_05 _1 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_app -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_app (_menhir_stack, _menhir_s, h) = _menhir_stack in
      let a = _v in
      let _v = _menhir_action_03 a h in
      _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_15 _menhir_stack _v _tok
      | MenhirState01 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState04 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_12 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LPARAN -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPARAN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPARAN (_menhir_stack, _menhir_s) = _menhir_stack in
          let (_1, _3, e) = ((), (), _v) in
          let _v = _menhir_action_09 _1 _3 e in
          _menhir_goto_sub_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_sub_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState09 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_07_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState01 ->
          _menhir_run_07_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState04 ->
          _menhir_run_07_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_07_spec_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_02 _1 in
      _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
  
  and _menhir_run_07_spec_01 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LPARAN -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_02 _1 in
      _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
  
  and _menhir_run_08 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LAMBDA _menhir_cell0_IDENTITY -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENTITY (_menhir_stack, p) = _menhir_stack in
      let MenhirCell1_LAMBDA (_menhir_stack, _menhir_s) = _menhir_stack in
      let (_1, b, _3) = ((), _v, ()) in
      let _v = _menhir_action_01 _1 _3 b p in
      let _1 = _v in
      let _v = _menhir_action_04 _1 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPARAN ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LAMBDA ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_07 i in
          _menhir_run_07_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IDENTITY _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_08 s in
          _menhir_run_07_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
