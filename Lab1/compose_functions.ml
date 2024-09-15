(*Function to take two functions ƒ and g and return a new function that is
the composition of ƒ and g (i.e., compose_functions ƒ g x = ƒ (g(x))*)
let compose_functions fncX fncG x =
  fncX (fncG x)

(* Test the composed function *)
let () =
  let result = compose_functions (fun x -> x * 2) (fun y -> y + 3) 5 in
  Printf.printf "Result of compose_functions 5: %d\n" result

