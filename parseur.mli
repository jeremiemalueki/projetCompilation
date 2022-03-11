type token =
  | NOMBRE
  | PLUS
  | MOINS
  | FOIS
  | GPAREN
  | DPAREN
  | EOL

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
