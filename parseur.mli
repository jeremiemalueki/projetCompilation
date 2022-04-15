type token =
  | NOMBRE
  | PLUS
  | MOINS
  | FOIS
  | GPAREN
  | DPAREN
  | PT_VIRG

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
