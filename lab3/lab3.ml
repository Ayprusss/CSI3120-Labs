type location = {
  name : string;
  x : float;
  y : float;
  priority : int;
}

type vehicle = {
  id : int;
  capacity : int;
  mutable route : location list;
}

let distance dist1 dist2 =
  sqrt ((dist2.x -. dist1.x) ** 2. +. (dist2.y -. dist1.y) ** 2.)

let rec split_n n list =
  if n <= 0 || list = [] then ([], list)
  else
    let (a1, a1s) = split_n (n - 1) (List.tl list) in
    (List.hd list :: a1, a1s)


let input_location idx =
  Printf.printf "Enter location name %d:\n" idx;
  let name = read_line () in
  print_endline "Enter X coordinates:";
  let x = float_of_string (read_line ()) in
  print_endline "Enter Y coordinates:";
  let y = float_of_string (read_line ()) in
  print_endline "Enter priority of shipment:";
  let priority = int_of_string (read_line ()) in
  { name; x; y; priority }

let input_vehicle id =
  print_string("Enter vehicle " ^ string_of_int id ^ "'s capacity:");
  let capacity = int_of_string (read_line ()) in
  { id; capacity; route = [] }

let sort_by_priority locations_list =
  List.sort (fun location1 location2 -> compare location2.priority location1.priority) locations_list

let rec assign_locations vehicles locations =
  match vehicles, locations with
  | [], _ | _, [] -> ()
  | vehicle::rest_vehicles, _ ->
    let assigned, remaining = split_n vehicle.capacity locations in
    vehicle.route <- assigned;
    assign_locations rest_vehicles remaining

let total_route_distance route =
  match route with
  | [] | [_] -> 0.0
  | first::rest ->
    let rec aux prev locs acc =
      match locs with
      | [] -> acc
      | loc::tl -> aux loc tl (acc +. distance prev loc)
    in aux first rest 0.0


let display_routes vehicle_list =
  List.iter (fun v ->
    Printf.printf "Vehicle %d's route:\n" v.id;
    List.iter (fun loc -> Printf.printf "%s -> " loc.name) v.route;
    Printf.printf "\nTotal distance: %.2f\n" (total_route_distance v.route)
  ) vehicle_list


let main () =
  print_endline "Enter number of delivery locations:";
  let num_locations = int_of_string (read_line ()) in
  let locations = List.init num_locations (fun i -> input_location (i + 1)) in
  let sorted_locations = sort_by_priority locations in

  print_endline "Enter number of vehicles:";
  let num_vehicles = int_of_string (read_line ()) in
  let vehicles = List.init num_vehicles (fun id -> input_vehicle (id + 1)) in

  assign_locations vehicles sorted_locations;
  display_routes vehicles


let () = 
  main ()