(** [cwd ()] returns the current working directory *)
let cwd () = try Sys.getcwd () with Sys_error s -> s

(** [cwd ()] returns the $HOME environment variable *)
let home () = try Sys.getenv "HOME" with Sys_error s -> s

(* TODO *)
let pretty_cwd =
  let cwd = cwd () in
  let r = Str.regexp (home ()) in
  try Str.replace_first r "~" cwd with Failure _ -> cwd

(* TODO *)
let v = "\027[30;47m" ^ pretty_cwd ^ "\027[0m "
