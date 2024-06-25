#!/bin/sh
# Install required opam packages

set -eu

opam install core core_bench utop user-setup merlin ocamlformat
opam user-setup install
