all:
	ocamlfind ocamlopt -o tic -linkpkg -package unix tic.ml
	ocamlfind ocamlopt -o doit -linkpkg -package unix -package lwt.unix -package lwt doit.ml

clean:
	rm -f *.o *.cm?
