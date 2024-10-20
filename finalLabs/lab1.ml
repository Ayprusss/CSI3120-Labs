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
  ;;


let rec filter_even l = 
  match l with
    | [] -> [] (* list is empty, so we return it*)
    | a::as -> (*list is not empty, so we check to see if it is divisble by 2*)
        if a mod 2 = 0 then
          a :: filter_even as
        else 
          filter_even as 
;;
      

let compose_functions fncX fncG x =
  fncX (fncG x)
;;

let rec reduce func acc list = 
  match list with
  | [] -> acc (*if list is empty, we return the accumulator*)
  | a::a1s -> reduce func (func acc a) a1s
;;

      
