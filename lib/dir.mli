val cwd : unit -> string
(** [cwd ()] returns the current working directory *)

val home : unit -> string
(** [home ()] returns the $HOME environment variable *)

val pretty_cwd : string
(** [pretty_cwd] is the path to `cwd` formatted in a "pretty" way *)

val v : string
(** [v] is the [pretty_cwd] with added terminal colors *)
