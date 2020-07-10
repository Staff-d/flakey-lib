{
  description = "A python library with awesome alogrithms! (to test nix-flakes)";
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.03;

  outputs = { self, nixpkgs }:
  let
    supportedSystems = [ "x86_64-linux" "i686-linux" "aarch64-linux" ];
    forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
    version = "0.1.${nixpkgs.lib.substring 0 8 self.lastModifiedDate}.${self.shortRev or "dirty"}";
  in
  {

    defaultPackage = forAllSystems ( system:

      with (import nixpkgs{inherit system;});
      python37Packages.buildPythonPackage rec {

        pname = "FlakeyLib";
        version = "0.1";

        src = ./.;

        buildInputs = with python37Packages; [pytestrunner];
        checkInputs = with python37Packages; [ pytest pylint pytestcov pytest-dependency pytest-pylint];

        preCheck = ''
        export PYLINTRC=$src/.pylintrc;
        export PYLINTHOME=$out
        '';

        #doCheck = false;
      }
    );

  };
}
