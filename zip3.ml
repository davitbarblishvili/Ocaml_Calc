(* Problem 1:

Write an OCaml function "zip3" that takes three lists and returns a
list of their elements combined elementwise as 3-tuples.  The result should
be the same length as the shortest given list.

E.g.,

zip3 [] [] [] = []

zip3 [1;2;3] [4;5;6] [7;8;9] = [(1, 4, 7); (2, 5, 8); (3, 6, 9)]

zip3 [1;2] ['a';'b';'c'] [0;0] = [(1, 'a', 0); (2, 'b', 0)]

*)

let rec zip3 (l1 : 'a list) (l2 : 'b list) (l3 : 'c list) : ('a * 'b * 'c) list
    = match l1, l2, l3 with 
    | hd1::tl1, hd2::tl2, hd3::tl3 -> (hd1, hd2, hd3) :: (zip3 tl1 tl2 tl3)
    | _,_,_ -> []
