open Bos

(* [git] commands and parsing *)
let git = Cmd.v "git"

let untracked = Str.regexp "??"

let changed_not_staged = Str.regexp " M"

(* calling of [git] commands, ignoring errors *)
let git_cmd_ignore_err cmd output = OS.Cmd.(run_out cmd ~err:err_null |> output)

let git_cmd_to_string cmd = git_cmd_ignore_err cmd OS.Cmd.to_string

let git_cmd_to_lines cmd = git_cmd_ignore_err cmd OS.Cmd.to_lines

let is_git_repo () =
  let git_rev_parse = Cmd.(git % "rev-parse") in
  match git_cmd_to_string git_rev_parse with Error _ -> false | Ok _ -> true

let git_branch () =
  let git_symbolic_ref = Cmd.(git % "symbolic-ref" % "HEAD") in
  match git_cmd_to_string git_symbolic_ref with
  (* not a branch, we have probably a commit checked out *)
  | Error _ -> (
      let git_rev_parse_short = Cmd.(git % "rev-parse" % "--short" % "HEAD") in
      match OS.Cmd.(run_out git_rev_parse_short ~err:err_null |> to_string) with
      | Ok s -> s
      | Error _ -> "" )
  | Ok s -> (
      let r = Str.regexp "refs/heads/" in
      try Str.replace_first r "" s with Failure _ -> s )

let git_status () =
  let git_status_porcelain = Cmd.(git % "status" % "--porcelain") in
  match git_cmd_to_lines git_status_porcelain with Error _ -> "" | Ok _s -> ""

let v = if is_git_repo () then "\027[31;40m" ^ git_branch () ^ "\027[0m" else ""
