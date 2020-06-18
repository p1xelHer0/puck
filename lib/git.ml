open Bos

let git = Cmd.v "git"

(** [is_git_repo ()] returns [true] if
    the current directory is a git repository *)
let is_git_repo () =
  let git_rev_parse = Cmd.(git % "rev-parse") in
  match OS.Cmd.(run_out git_rev_parse ~err:err_null |> to_string) with
  | Ok _ -> true
  | Error _ -> false

(** [git_branch ()] returns the name of the current git branch *)
let git_branch () =
  let git_status = Cmd.(git % "symbolic-ref" % "HEAD") in
  let cmd_s = Util.run git_status |> Util.cmd_to_string in
  let r = Str.regexp "refs/heads/" in
  try Str.replace_first r "" cmd_s with Failure _ -> cmd_s

(* TODO *)
let v =
  if is_git_repo () then "\027[31;40m" ^ git_branch () ^ "\027[0m\n" else ""
