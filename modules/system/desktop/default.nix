{
  self,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.desktop = moduleWithSystem ({pkgs, ...}: let
    modules = with self.nixosModules; [
      core
      network
      #sops
    ];
  in {
    imports = modules;
    environment.systemPackages = with pkgs; [
      mpv
    ];
  });
}
