{...}: {
  flake.nixosModules.neuromancerConfiguration = {pkgs, ...}: {
    virtualisation.docker = {
      enable = true;
    };
    networking = {
      hostName = "neuromancer";
    };
    environment.systemPackages = with pkgs; [
    ];
  };
}
