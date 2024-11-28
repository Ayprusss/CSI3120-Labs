(* Define a type alias for the grid *)
type grid = int array array

(* Print the Sudoku grid *)
let print_grid grid =
  Array.iter (fun row ->
    Array.iter (fun x -> Printf.printf "%d " x) row;
    print_newline ()
  ) grid;
  print_newline ()

(* Check if a number can be placed in the current row, column and subgrid *)
let is_valid grid row col num =
  let n = Array.length grid in
  let subgrid_size = int_of_float (sqrt (float_of_int n)) in
  
  (* Row check *)
  let row_valid = Array.for_all (fun x -> x <> num) grid.(row) in
  
  (* Column check *)
  let col_valid = Array.for_all (fun row -> row.(col) <> num) grid in
  
  (* Subgrid check *)
  let subgrid_row_start = (row / subgrid_size) * subgrid_size in
  let subgrid_col_start = (col / subgrid_size) * subgrid_size in
  let subgrid_valid =
    let subgrid = ref true in
    for r = subgrid_row_start to subgrid_row_start + subgrid_size - 1 do
      for c = subgrid_col_start to subgrid_col_start + subgrid_size - 1 do
        if grid.(r).(c) = num then subgrid := false
      done
    done;
    !subgrid
  in

  row_valid && col_valid && subgrid_valid

(* Find an empty cell *)
let find_empty grid =
  let found = ref None in
  let n = Array.length grid in
  for i = 0 to n - 1 do
    for j = 0 to n - 1 do
      if grid.(i).(j) = 0 then found := Some (i, j)
    done
  done;
  !found

(* Backtracking solver *)
let rec solve grid =
  match find_empty grid with
  | None -> true (* No empty cells, puzzle solved *)
  | Some (row, col) ->
    let rec try_numbers n =
      if n > 4 then false (* If no numbers fit, return false *)
      else if is_valid grid row col n then begin
        grid.(row).(col) <- n; (* Place the number *)
        if solve grid then
          true
        else begin
          grid.(row).(col) <- 0; (* Backtrack *)
          try_numbers (n + 1)
        end
      end else
        try_numbers (n + 1) (* Try the next number *)
    in
    try_numbers 1


(* Main function to solve and print the Sudoku grid *)
let solve_sudoku grid =
  if solve grid then
    print_grid grid
  else
    Printf.printf "No solution exists\n"

(* Example test with one of the puzzles from the assignment *)
let puzzle = [|
  [| 0; 0; 0; 2 |];
  [| 0; 3; 4; 0 |];
  [| 0; 0; 0; 0 |];
  [| 2; 0; 0; 0 |]
|]

(* Entry point to solve the Sudoku *)
let () =
  solve_sudoku puzzle
