let _ = 
    let argc= Array.length Sys.argv in
    let entree = if (argc==2) then (open_in Sys.argv.(1)) else (stdin) in
    let sortie = if (argc==2) then (open_out (Sys.argv.(1) ^".jsm")) else (stdout) in

    try
        let lexbuf = Lexing.from_channel entree in
        while true do (*on ne s'arrete pas *)
            Parseur.main Lexeur.token lexbuf (*parseur ligne*)
            |> AST.code
            |> Printf.fprintf sortie "%s\n%!"  ;
            (* |> Format.printf "%a\n%!" AST.print_AST ; *)
        done
    with
        | Lexeur.Eof -> exit 0 (*impossible*)
        | Lexeur.TokenInconu (*erreur de lexing*)
        | Parsing.Parse_error -> (*erreur de parsing*)
            Printf.printf ("Ceci n'est pas une expression arithmetique\n")