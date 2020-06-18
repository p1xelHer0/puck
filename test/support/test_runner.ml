open Puck_test

let () = Alcotest.run "puck" [ ("Utils", Utils_test.suite) ]
