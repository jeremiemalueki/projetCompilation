(*fichier lexeur.mll *)
{
    open Parseur
    exception Eof
    exception TokenInconu
}
rule token = parse
        [' ' '\t' '\n'] { token lexbuf }
    | ['0'-'9']+ { NOMBRE }
    | '+' { PLUS }
    | '-' { MOINS }
    | '*' { FOIS }
    | '(' { GPAREN }
    | ')' { DPAREN }
    | ';' {PT_VIRG}
    | eof { raise Eof }
    | _ { raise TokenInconu }
    