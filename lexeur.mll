(*fichier lexeur.mll *)
{
    open Parseur
    exception Eof
    exception TokenInconu
}
rule token = parse
        [' ' '\t' '\n' '\r'] { token lexbuf }
    | (['0'-'9']+ '.')? ['0'-'9']+ {NOMBRE}
    | ['-''+']?['0'-'9']*'.'?['0'-'9']+(['e''E']['-''+']?['0'-'9']+)? {NOMBRE}
    | "True" | "False" { BOOLEAN }
    | "NaN" { NAN }
    | "==" { EQUALS }
    | "<"   { INF }
    | ">"   { SUP }
    | "<=" { INF_EQUALS }
    | ">="   { SUP_EQUALS }
    | "!"   { NOT }
    | "!="  { NOT_EQUALS }
    | '+' { PLUS }
    | '-' { MOINS }
    | '*' { FOIS }
    | '%' { MOD }
    | '(' { GPAREN }
    | ')' { DPAREN }
    | [';'] { PT_VIRG }
    | eof { raise Eof }
    | _ { raise TokenInconu }