type operator = Add | Sub | Mul | Div | Seq

type expr =
    Binop of expr * operator * expr
  | Assign of string * expr 
  | Lit of int
  | Var of string
 