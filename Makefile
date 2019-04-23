all:
	ocamlfind ocamlopt -o tic -linkpkg -package unix tic.ml

clean:
	rm -f *.o *.cm?
