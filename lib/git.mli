val git : Bos.Cmd.t
(** [git] is is the git command of Bos.Cmd.t *)

val untracked : Str.regexp
(** [untracked] for parsing [git status --porcelain] untracked files *)

val changed_not_staged : Str.regexp
(** [changed_not_staged] for parsing [git status --porcelain] unstaged changes *)

val git_cmd_ignore_err : Bos.Cmd.t -> (Bos.OS.Cmd.run_out -> 'a) -> 'a
(** [git_cmd_ignore_err cmd output] runs [cmd] to [output] with error redirected to [Bos.OS.Cmd.err_null] 
    this equals [Bos.OS.Cmd.run_out cmd ~err:Bos.OS.Cmd.err_null |> output] *)

val git_cmd_to_string : Bos.Cmd.t -> (string, [> Rresult.R.msg ]) result
(** [git_cmd_to_string] equals [git_cmd_ignore_err cmd Bos.OS.Cmd.to_string] *)

val git_cmd_to_lines : Bos.Cmd.t -> (string list, [> Rresult.R.msg ]) result
(** [git_cmd_to_string] equals [git_cmd_ignore_err cmd Bos.OS.Cmd.to_lines] *)

val is_git_repo : unit -> bool
(** [is_git_repo ()] returns [true] if
    the current directory is a git repository
    other wise [false] *)

val git_branch : unit -> string
(** [git_branch ()] returns the name of the current git branch 
    or the current checked out commit hash *)

val git_status : unit -> string
(** [git_status ()] returns the name of the current git branch *)

val v : string
(** [v] is the [git_branch ()] with added terminal colors *)
