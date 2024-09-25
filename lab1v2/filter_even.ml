let filter_even l = 
  list.filter (fun x -> x mod 2 = 0) l
;;


let even_numbers = filter_even [1; 2; 3; 4; 5; 6];;
