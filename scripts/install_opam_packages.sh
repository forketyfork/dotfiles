#!/bin/sh
# Configure opam and install required opam packages

set -eu

opam init -y
eval "$(opam env)"
opam install core core_bench utop -y
