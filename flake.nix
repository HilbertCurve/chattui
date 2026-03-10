{
  description = "C/C++ development environment with GCC and CMake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          gcc
          gdb
          valgrind
          gnumake
          clang-tools

          # Build Tools
          cmake
          cmake-language-server
          pkg-config

          # Libaries
          ncurses
          openssl

        ];
        shellHook = ''
          mkdir -p build src include
          cmake -B build -S . -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
          echo "Shell Ready."
        '';
      };
    };
}
