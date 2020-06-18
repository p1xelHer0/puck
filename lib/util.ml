open Bos

(* TODO *)
let run cmd = OS.Cmd.(run_out cmd |> to_string)

(* TODO *)
let cmd_to_string cmd =
  match cmd with Ok s -> s | Error e -> ( match e with `Msg s -> s )

(* TODO: Just for tests right now *)
let greet name = "Hello " ^ name ^ "!"
