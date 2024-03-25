(* Z -> S $
   S -> O E
   O -> [ 
   E -> iK
   K -> -E | +E | ]
 *)                  
open Tree                    
open Reader
   
exception Error of string
let rec parse_Z () =          
  let x = parse_S () in eat EOF; x


and parse_S () =              
  match lookahead () with
  | Ch '[' 
    ->  let x1 = parse_O () in
        let x2 = parse_E () in
        Node ("S",[x1;x2])
  | _ -> raise (Error "parsing S")

and parse_O () = 
  match lookahead() with 
  | Ch '[' 
   -> eat(Ch '[');
      Leaf '['
  | _ -> raise (Error "parsing O")
  

and parse_E () = 
  match lookahead() with 
  | Ch 'i' 
    -> eat (Ch 'i') ;
    let x =parse_K() in 
    Node("E",[Leaf 'i';x])
    

  | _ -> raise (Error "parsing E")

and  parse_K () = 
  match lookahead() with
  | Ch ']'-> 
    eat(Ch ']');
    Leaf ']'
  |Ch '+' -> 
    eat (Ch '+') ;
    let x =parse_E() in 
    Node("K",[Leaf '+';x])
  |Ch '-' ->
    eat (Ch '-') ;
    let x =parse_E() in 
    Node("K",[Leaf '-';x])
  |_ -> raise(Error "parsing K")


  
  
(* a compléter*)

         
let parse () = parse_Z ()
