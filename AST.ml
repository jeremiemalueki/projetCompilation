type expression_a =
    | Plus  of expression_a * expression_a
    | Moins of expression_a * expression_a
    | Mult  of expression_a * expression_a
    | Div   of expression_a * expression_a
    | Mod   of expression_a * expression_a
    | Neg   of expression_a
    | Equals   of expression_a * expression_a
    | Inf_equals   of expression_a * expression_a
    | Inf   of expression_a * expression_a
    | Not   of expression_a
    | Boolean   of bool
    | Num   of float
;;


(* Fonctions d'affichage *)

let rec print_binaire form s g d = Format.fprintf form "@[<2>%s%s@ %a%s@ %a%s@]" s "(" print_AST g " ," print_AST d " )" 

and print_AST form = let open Format in function
    | Plus  (g,d) -> print_binaire form "Plus" g d
    | Moins (g,d) -> print_binaire form "Moins" g d
    | Mult  (g,d) -> print_binaire form "Mult" g d
    | Div   (g,d) -> print_binaire form "Div" g d
    | Mod (g,d) -> print_binaire form "Mod" g d
    | Neg    e    -> fprintf form "@[<2>%s@ %a@]" "Neg" print_AST e
    | Equals (g,d) -> print_binaire form "Equals" g d
    | Inf_equals (g,d) -> print_binaire form "Inf_equals" g d
    | Inf (g,d) -> print_binaire form "Inf" g d
    | Not e    -> fprintf form "@[<2>%s@ %a@]" "Not" print_AST e
    | Boolean b    -> fprintf form "@[<2>%s@ %b@]" "Boolean" b
    | Num    n    -> fprintf form "@[<2>%s@ %f@]" "Num" n
;; 
