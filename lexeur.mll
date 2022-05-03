(*fichier lexeur.mll *)
{
    open Parseur
    exception Eof
    exception TokenInconu
}
rule token = parse
        [' ' '\t' '\n' '\r'] { token lexbuf }
    | (['0'-'9']+ '.')? ['0'-'9']+ { NOMBRE }
    | 'True'|'False' {BOOLEAN}
    | '+' { PLUS }
    | '-' { MOINS }
    | '*' { FOIS }
    | '%' {MOD}
    | '(' { GPAREN }
    | ')' { DPAREN }
    | [';'] { PT_VIRG }
    | eof { raise Eof }
    | _ { raise TokenInconu }