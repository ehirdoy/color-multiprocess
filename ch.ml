while true do
  print_endline Sys.argv.(1);
  Unix.sleep 1;
done
(* ocamlfind ocamlopt -o ch -linkpkg -package unix ch.ml *)
