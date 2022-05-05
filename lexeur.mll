(*fichier lexeur.mll *)
{
    open Parseur
    exception Eof
    exception TokenInconu
}
rule token = parse
        [' ' '\t' '\n' '\r'] { token lexbuf }
    | (['0'-'9']+ '.')? ['0'-'9']+ as lexem { NOMBRE(float_of_string lexem) }
    | "True" | "False" as lexem { BOOLEAN(bool_of_string (String.lowercase_ascii lexem)) }
    | "==" {EQUALS}
    | "<"   {INF}
    | "<=" {INF_EQUALS}
    | "!"   {NOT}
    | '+' { PLUS }
    | '-' { MOINS }
    | '*' { FOIS }
    | '%' { MOD }
    | '(' { GPAREN }
    | ')' { DPAREN }
    | ';' { PT_VIRG }
    | eof { raise Eof }
    | _ { raise TokenInconu }