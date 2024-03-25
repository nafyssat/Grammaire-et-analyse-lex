(* Z -> S $
  A completer
 *) 

(* open Token
open Tree
open Reader
 *)




exception Error of string
let rec parse_Z () =
parse_S ()

and parse_S () = match lookahead() with 
| LPAR | INT (n) -> let x = parse_T() in 
                    let y = parse_E() in 
                    Node("S" ,[x;y])
|_ -> raise(Error "Syntax error")

and parse_T () = match lookahead() with 
| LPAR -> eat LPAR ; 
         let x = parse_S() in 
         eat RPAR ;
         Node("T", [Leaf LPAR;x;Leaf RPAR])
|INT n -> eat INT n ;
| _->raise(Error ("Expected")




let parse () = parse_Z ()
