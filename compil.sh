#! /bin/sh

ocamllex lexeur.mll
ocamlyacc parseur.mly
ocamlc -c parseur.mli lexeur.ml parseur.ml main.ml
ocamlc -o main lexeur.cmo parseur.cmo main.cmo