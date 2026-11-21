{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.neuromancer = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      neuromancerConfiguration
      desktop
    ];
  };
}
