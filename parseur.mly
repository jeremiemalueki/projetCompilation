%{
    open AST
%}
%token <float> NOMBRE
%token <bool> BOOLEAN
%token PLUS MOINS FOIS GPAREN DPAREN PT_VIRG MOD BOOLEAN NOT INF INF_EQUALS EQUALS
%left EQUALS INF INF_EQUALS
%left PLUS MOINS
%left FOIS MOD
%nonassoc UMOINS


%type <AST.expression_a> main expression
%start main
%%
main:
    expression PT_VIRG { $1 }
;
expression:
expression PLUS expression { Plus ($1,$3) }
| expression MOINS expression { Moins ($1,$3) }
| expression FOIS expression { Mult ($1,$3) }
| expression MOD expression { Mod ($1,$3) }
| GPAREN expression DPAREN { $2 }
| MOINS expression %prec UMOINS { Neg $2 }
| expression EQUALS expression { Equals($1,$3) }
| expression INF expression { Inf($1,$3) }
| expression INF_EQUALS expression { Inf_equals($1,$3) }
| NOT expression { Not $2 }
| BOOLEAN { Boolean $1 }
| NOMBRE { Num $1 }
;
