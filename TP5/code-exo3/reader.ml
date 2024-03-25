open Token

exception Error of string

(* type token = Ch of char | EOF
let string_of_token = function
  | Ch c -> String.make 1 c
  | EOF -> "EOF" *)


let lexbuf = Lexing.from_channel stdin                       

let input_buffer = ref EOF

let scan () =
 input_buffer := Lexer.lexeur lexbuf
  
    
let _ = scan () (* initial fill of input_buffer *)
                 
let eat expected_token =
  if !input_buffer = expected_token
  then scan ()
  else raise (Error ("Expected "^(string_of_token expected_token)^
                          " but got an "^(string_of_token !input_buffer)))

let lookahead () = !input_buffer

