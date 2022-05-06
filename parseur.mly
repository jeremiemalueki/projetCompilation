%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN PT_VIRG MOD BOOLEAN NOT INF INF_EQUALS SUP SUP_EQUALS EQUALS NOT_EQUALS
%left EQUALS INF INF_EQUALS SUP SUP_EQUALS NOT_EQUALS
%left PLUS MOINS
%left FOIS MOD
%nonassoc UMOINS NOT

%type <unit> main expression
%start main
%%
main:
    expression PT_VIRG {}
;
expression:
expression PLUS expression {}
| expression MOINS expression {}
| expression FOIS expression {}
| expression MOD expression {}
| GPAREN expression DPAREN {}
| MOINS expression %prec UMOINS {}
| expression EQUALS expression {}
| expression INF expression {}
| expression INF_EQUALS expression {}
| expression SUP expression {}
| expression SUP_EQUALS expression {}
| NOT expression {}
| expression NOT_EQUALS expression {}
| BOOLEAN {}
| NOMBRE {}
;
