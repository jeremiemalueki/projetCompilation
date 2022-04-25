type token =
  | NOMBRE
  | PLUS
  | MOINS
  | FOIS
  | GPAREN
  | DPAREN
  | PT_VIRG

open Parsing;;
let _ = parse_error;;
let yytransl_const = [|
  257 (* NOMBRE *);
  258 (* PLUS *);
  259 (* MOINS *);
  260 (* FOIS *);
  261 (* GPAREN *);
  262 (* DPAREN *);
  263 (* PT_VIRG *);
    0|]

let yytransl_block = [|
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\003\000\003\000\004\000\004\000\
\004\000\000\000"

let yylen = "\002\000\
\002\000\003\000\003\000\001\000\003\000\001\000\003\000\002\000\
\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\009\000\000\000\000\000\010\000\000\000\000\000\
\006\000\008\000\000\000\000\000\000\000\001\000\000\000\007\000\
\000\000\000\000\005\000"

let yydgoto = "\002\000\
\006\000\007\000\008\000\009\000"

let yysindex = "\011\000\
\016\255\000\000\000\000\016\255\016\255\000\000\013\255\014\255\
\000\000\000\000\020\255\016\255\016\255\000\000\016\255\000\000\
\014\255\014\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\255\254\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\001\255\007\255\000\000"

let yygindex = "\000\000\
\000\000\022\000\012\000\252\255"

let yytablesize = 27
let yytable = "\010\000\
\004\000\004\000\002\000\002\000\004\000\004\000\002\000\002\000\
\003\000\003\000\019\000\001\000\003\000\003\000\012\000\013\000\
\003\000\015\000\004\000\014\000\005\000\012\000\013\000\017\000\
\018\000\016\000\011\000"

let yycheck = "\004\000\
\002\001\003\001\002\001\003\001\006\001\007\001\006\001\007\001\
\002\001\003\001\015\000\001\000\006\001\007\001\002\001\003\001\
\001\001\004\001\003\001\007\001\005\001\002\001\003\001\012\000\
\013\000\006\001\005\000"

let yynames_const = "\
  NOMBRE\000\
  PLUS\000\
  MOINS\000\
  FOIS\000\
  GPAREN\000\
  DPAREN\000\
  PT_VIRG\000\
  "

let yynames_block = "\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : unit) in
    Obj.repr(
# 6 "parseur.mly"
                   ()
# 88 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : unit) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 9 "parseur.mly"
                      ()
# 96 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : unit) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 10 "parseur.mly"
                         ()
# 104 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 11 "parseur.mly"
        ()
# 111 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : unit) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 14 "parseur.mly"
                   ()
# 119 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 15 "parseur.mly"
          ()
# 126 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : unit) in
    Obj.repr(
# 18 "parseur.mly"
                             ()
# 133 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 19 "parseur.mly"
                             ()
# 140 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    Obj.repr(
# 20 "parseur.mly"
                             ()
# 146 "parseur.ml"
               : unit))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : unit)
