let rec reduce func acc list = 
    match list with
    | [] -> acc (*if list is empty, we return the accumulator*)
    | a::a1s -> reduce func (func acc a) a1s
  ;;


  let () = 
  let result = reduce (fun x y -> x + y) 0 [1; 2; 3; 4] in
  Printf.printf "Reduce Function Result: %d\n" result