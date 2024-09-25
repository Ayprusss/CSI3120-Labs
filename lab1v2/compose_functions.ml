let compose_functions function1 function2 =
  fun x -> function1 (function2 x)
;;