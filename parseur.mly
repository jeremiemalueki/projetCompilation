%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN PT_VIRG MOD BOOLEAN

%left PLUS MOINS
%left FOIS
%nonassoc UMOINS

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
| BOOLEAN {}
| NOMBRE {}
;
