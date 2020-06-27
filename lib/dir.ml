let cwd () = try Sys.getcwd () with Sys_error s -> s

let home () = try Sys.getenv "HOME" with Sys_error s -> s

let pretty_cwd =
  let cwd = cwd () in
  let r = Str.regexp (home ()) in
  try Str.replace_first r "~" cwd with Failure _ -> cwd

let v = "\027[36m" ^ pretty_cwd ^ "\027[0m "
