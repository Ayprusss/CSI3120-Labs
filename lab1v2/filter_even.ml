let rec filter_even l = 
  match l with
    | [] -> [] (* list is empty, so we return it*)
    | a::as -> (*list is not empty, so we check to see if it is divisble by 2*)
        if a mod 2 = 0 then
          a :: filter_even as
        else 
          filter_even as 
;;




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