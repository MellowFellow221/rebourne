{ self, inputs, ... }: {
  flake.nixosConfigurations.neuromancer = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.neuromancerConfiguration
    ];
  };
}