(*fichier lexeur.mll *)
{
    open Parseur
    exception Eof
    exception TokenInconu
}
rule token = parse
        [' ' '\t' '\n' '\r'] { token lexbuf }
    | (['0'-'9']+ '.')? ['0'-'9']+ as lexem { NOMBRE(float_of_string lexem) }
    | ['0'-'9']*'.'?['0'-'9']+(['e''E']['-']?['0'-'9']+)? as lexem {NOMBRE (float_of_string lexem)}
    | "NaN" as lexem {NOMBRE (float_of_string lexem)}
    | "True" | "False" as lexem { BOOLEAN(bool_of_string (String.lowercase_ascii lexem)) }
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
    | ';' { PT_VIRG }
    | eof { raise Eof }
    | _ { raise TokenInconu }