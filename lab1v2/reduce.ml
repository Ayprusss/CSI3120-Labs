let rec reduce f counter l =
  match l with
  | [] -> counter
  | a :: a1s -> reduce f (f counter a) a1s
;;

