{ pkgs }:

pkgs.writeShellScriptBin "julia" ''
  VERS=$(juliaup status | sed -n -e "s/ *\*.* 1/1/p")

  NIX_LD_LIBRARY_PATH=~/.julia/juliaup/''${VERS}/lib/julia ~/.juliaup/bin/julia "$@"

''