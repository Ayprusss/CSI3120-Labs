(*Function to take a function, an inital value and a list to "apply" to the original value*)
let rec reduce fnctn acc list1 = 
  match list1 with
  | [] -> acc (*Base case if the array is empty, there's nothing to do*)
  | x::xs -> reduce fnctn (fnctn acc x) xs (* Recursive case: apply f to accumulator and current element *)

let () = 
  let result = reduce (fun x y -> x + y) 0 [1; 2; 3; 4] in
  Printf.printf "Reduce Function Result: %d\n" result