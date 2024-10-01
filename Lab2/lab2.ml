(* Step 1: Define Job Representation *)
type job = {
  start_time: int;  (* time in minutes from midnight *)
  duration: int;
  priority: int;
};;

(* Step 2: Convert Time to Minutes *)
let time_to_minutes hours minutes =
  (hours * 60) + minutes;;

let read_int prompt =
  print_string prompt;
  read_int ();;

(* Step 3: Reading Input from the Terminal *)
let read_jobs n =
  let rec aux i acc =
    if i > n then acc
    else
      let hours = read_int ("For job " ^ string_of_int i ^ ", enter start time (hours): ") in
      let minutes = read_int ("Start time (minutes): ") in
      let duration = read_int "Duration (minutes): " in
      let priority = read_int "Priority: " in
      let start_time = time_to_minutes hours minutes in
      let job = {start_time; duration; priority} in
      aux (i + 1) (job :: acc)
  in aux 1 [];;

(* Step 4: Implement Scheduling Functions *)
let schedule_jobs jobs =
  let sorted_jobs = List.sort (fun j1 j2 -> compare j1.start_time j2.start_time) jobs in
  let rec aux scheduled = function
    | [] -> List.rev scheduled
    | job :: rest ->
        match scheduled with
        | [] -> aux [job] rest
        | last_job :: _ when last_job.start_time + last_job.duration <= job.start_time -> aux (job :: scheduled) rest
        | _ -> aux scheduled rest
  in aux [] sorted_jobs;;
  
(* Step 4a: Sorting jobs by priority *)
let schedule_jobs_max_priority jobs =
  List.sort (fun j1 j2 -> compare j2.priority j1.priority) jobs;;

(* Reduce Idle time by scheduling jobs in the order that leavs the least gaps between them *)
let schedule_jobs_min_idle jobs =
  let sorted_jobs = List.sort (fun j1 j2 -> compare j1.start_time j2.start_time) jobs in
  let rec aux scheduled remaining_jobs =
    match remaining_jobs with
    | [] -> List.rev scheduled
    | [job] -> List.rev (job :: scheduled)
    | job1 :: job2 :: rest ->
        if job1.start_time + job1.duration <= job2.start_time then
          aux (job1 :: scheduled) (job2 :: rest)
        else aux (job2 :: scheduled) (job1 :: rest)
  in aux [] sorted_jobs;;

(* Step 5: Print Scheduled Jobs *)
let print_job job =
  Printf.printf "Job scheduled: Start Time = %d minutes, Duration = %d minutes, Priority = %d\n"
    job.start_time job.duration job.priority;;

let print_schedule jobs =
  List.iter print_job jobs;;

(* Step 6: Main Function *)
let () =
  let n = read_int "How many jobs do you want to schedule? " in
  let jobs = read_jobs n in
  let strategy = read_int "Choose a scheduling strategy (1 for No Overlaps, 2 for Max Priority, 3 for Minimize Idle Time): " in
  let scheduled_jobs = match strategy with
    | 1 -> schedule_jobs jobs
    | 2 -> schedule_jobs_max_priority jobs
    | 3 -> schedule_jobs_min_idle jobs
    | _ -> failwith "Invalid strategy"
  in
  print_schedule scheduled_jobs;;
