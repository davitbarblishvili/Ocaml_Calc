open Ast

module StringHash = Hashtbl.Make(struct
      type t = string 
      let equal x y = x = y 
      let hash = Hashtbl.hash 
      end)

let vals = StringHash.create 10


let rec eval = function 
    Lit(x)              -> x
    | Var(x)            -> StringHash.find vals x
  | Binop(e1, op, e2) ->
      let v1  = eval e1 in
      let v2 = eval e2 in
      (match op with
	  Add -> v1 + v2
      | Sub -> v1 - v2
      | Mul -> v1 * v2
      | Div -> v1 / v2
      | Seq -> v2)
  | Assign(m1, m2) -> 
      let n2 = eval m2 in
      let ()= StringHash.add vals m1 n2
      in n2

      
let _ =
  let lexbuf = Lexing.from_channel stdin in
  let expr = Parser.expr Scanner.tokenize lexbuf in
  let result = eval expr in
  print_endline (string_of_int result)
