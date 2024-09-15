exception Arrays_unequal_length;;

(*Recursive function to call *)
let rec map2 fnctn list1 list2 = 
  match (list1, list2) with 
  | ([],[]) -> [] (*If both arrays are empty, return an empty array*)
  | ([], _) | (_, []) -> raise Arrays_unequal_length (*If the arrays are of unequal length, raise the custom exception we made earlier*)
  | (x::xs, y::ys) -> (fnctn x y) :: (map2 fnctn xs ys) (*Because we don't have for loops in ocaml, apply fnctn to the elements and then call the function recursively to apply it to the next set*)


(* Function to print a list of integers *)
let rec print_list = function
  | [] -> print_endline ""  (* Print newline when list ends *)
  | x::xs -> 
      print_int x; 
      print_string " ";  (* Print each element followed by a space *)
      print_list xs

let () = 
  let result = map2 (fun x y -> x + y) [1; 2; 3] [4; 5; 6] in
  print_string "Result: ";
  print_list result