{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  inherit (lib) optional optionals;
  elixir = beam.packages.erlangR21.elixir_1_7;
in

mkShell {
  buildInputs = [ elixir libnotify inotify-tools ];

  shellHook = ''
    source .envrc
  '';
}

