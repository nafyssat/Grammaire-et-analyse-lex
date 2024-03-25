all: compile

compile:
	ocamlc tree.mli
	ocamlc tree.ml
	ocamlc reader.mli
	ocamlc reader.ml
	ocamlc parser.mli
	ocamlc reader.cmo parser.ml
	ocamlc -o main tree.cmo reader.cmo parser.cmo main.ml

clean:
	rm *.cmo *.cmi
