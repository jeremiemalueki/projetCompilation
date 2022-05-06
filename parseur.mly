%{
    open AST
%}
%token <float> NOMBRE
%token <bool> BOOLEAN
%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN PT_VIRG MOD
%token BOOLEAN NOT INF INF_EQUALS SUP SUP_EQUALS EQUALS NOT_EQUALS 
%left EQUALS INF INF_EQUALS SUP SUP_EQUALS NOT_EQUALS
%left PLUS MOINS
%left FOIS MOD
%nonassoc UMOINS NOT


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
| expression SUP expression { Sup($1,$3) }
| expression SUP_EQUALS expression { Sup_equals($1,$3) }
| NOT expression { Not $2 }
| expression NOT_EQUALS expression { Not_equals($1,$3) }
| BOOLEAN { Boolean $1 }
| NOMBRE { Num $1 }
;
