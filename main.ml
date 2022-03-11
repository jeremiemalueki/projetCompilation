let _ = 
    try
        let lexbuf = Lexing.from_channel stdin in (*lexeur lancé sur stdin *)
        while true do (*on ne s'arrete pas *)
            Parseur.main Lexeur.token lexbuf (*parseur ligne*)
        done
    with
        | Lexeur.Eof -> exit 0 (*impossible*)
        | Lexeur.TokenInconu (*erreur de lexing*)
        | Parsing.Parse_error -> (*erreur de parsing*)
            Printf.printf ("Ceci n'est pas une expression arithmetique\n")