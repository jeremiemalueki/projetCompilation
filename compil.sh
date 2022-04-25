#! /bin/sh

ocamllex lexeur.mll
ocamlyacc parseur.mly
ocamlc -c AST.ml
ocamlc -i AST.ml > AST.mli
ocamlc -c parseur.mli lexeur.ml parseur.ml main.ml
ocamlc -o main lexeur.cmo parseur.cmo AST.cmo main.cmo