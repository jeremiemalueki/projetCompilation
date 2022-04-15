let _ = 
    try
        let argc= Array.length Sys.argv in
        let lexbuf = if (argc==2) then Lexing.from_channel (open_in Sys.argv.(1)) 
            else Lexing.from_channel stdin in (*lexeur lancé sur stdin *)
        while true do (*on ne s'arrete pas *)
            Parseur.main Lexeur.token lexbuf (*parseur ligne*)
            |> Printf.printf "%i\n%!";
        done
    with
        | Lexeur.Eof -> exit 0 (*impossible*)
        | Lexeur.TokenInconu (*erreur de lexing*)
        | Parsing.Parse_error -> (*erreur de parsing*)
            Printf.printf ("Ceci n'est pas une expression arithmetique\n")