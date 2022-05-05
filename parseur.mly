%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN PT_VIRG MOD BOOLEAN INF INF_EQUALS EQUALS
%left EQUALS INF INF_EQUALS
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
| NOT expression {}
| BOOLEAN {}
| NOMBRE {}
;
