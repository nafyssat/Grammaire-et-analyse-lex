{
  exception Eof
  let liste = ref []
}

let digit = ['0'-'9']
  
rule lexeur = parse
  | digit as c	{ liste := ((int_of_char c) - (int_of_char '0'))::(!liste) }
  | _           { lexeur lexbuf }
  | eof		{ raise Eof }



{
  let ch = open_in (Sys.argv.(1)) in
  let lexbuf = Lexing.from_channel ch in
  let sum = ref 0 in
  try
    while true do
      lexeur lexbuf ;
      sum:= !sum + List.hd (!liste);
    done ;
    print_int( !sum );
    
   
   

  with Eof -> (List.iter print_int !liste; print_newline())
}
