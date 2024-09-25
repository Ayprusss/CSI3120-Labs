exception UnequalLengthLists

let rec map2 function1 lst1 lst2 =
  match (lst1, lst2) with
  | ([], []) -> []
  | ([], _) | (_, []) -> raise UnequalLengthLists
  | (a1 :: a1s, b :: bs) -> (function1 a1 b1) :: (map2 function1 a1s bs)
;;