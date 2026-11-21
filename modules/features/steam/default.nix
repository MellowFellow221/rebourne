{moduleWithSystem, ...}: {
  flake.nixosModules.steam = moduleWithSystem ({
		pkgs,
    unfreePkgs,
    inputs',
    lib,
    ...
  }: {
    environment.systemPackages = [
    ];
    programs.steam = {
      enable = true;
      protontricks.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  });
}
