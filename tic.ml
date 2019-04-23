(* #!/usr/bin/env ocaml
 *
 * #use "topfind"
 * #require "unix" *)

let _ =
  let tic = (try Unix.getenv "TIC" with _ -> "1") |> int_of_string in
  let rep = (try Unix.getenv "REP" with _ -> "3") |> int_of_string in
  for i=0 to rep-1 do
    Unix.sleep tic;
    Printf.printf "hello(%d) %d/%d\n" tic i rep;
    flush stdout;
  done


