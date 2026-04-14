{ self, inputs, ... }: {

  flake.nixosModules.neuromancerConfiguration = { pkgs, lib, ... }: {
    # import any other modules from here
    imports = [
      self.nixosModules.neuromancerHardware
      self.nixosModules.niri
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
    # ...
  };

}