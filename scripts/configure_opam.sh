#!/bin/sh
# Installing ocaml on macos
# Just initialize ocaml, since both ocaml and opam are installed via nix

set -eu

opam init -y
eval "$(opam env)"
opam install core core_bench utop user-setup merlin ocamlformat -y
opam user-setup install
