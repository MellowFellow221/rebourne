{ inputs, nixpkgs }:

let
  # Define a helper to avoid repeating boilerplate
  mkSystem = hostname: system: nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; }; # Pass inputs to all modules
    modules = [
      ./${hostname}/configuration.nix
    ];
  };
in
{
  neuromancer = mkSystem "neuromancer" "x86_64-linux";
  failsafe  = mkSystem "failsafe" "x86_64-linux";
  raspi = mkSystem "raspi" "aarch64-linux";
  vps = mkSystem "vps" "x86_64-linux";
  wintermute = mkSystem "wintermute" "x86_linux";
}