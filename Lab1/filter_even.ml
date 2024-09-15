(*Function to filter and return only the even numbers of a list*)
let filter_even list1 =
  List.filter (fun x -> x mod 2 = 0) list1 (*filter using the built in filter function*)

let rec print_list = function
  | [] -> print_endline ""  (* Print newline when list ends *)
  | x::xs -> 
      print_int x; 
      print_string " ";  (* Print each element followed by a space *)
      print_list xs

(*Example Usage for filter_even*)
let () = 
  let result = filter_even [1; 2; 3; 4; 5; 6] in
  print_string "Result of filter even: ";
  print_list result

