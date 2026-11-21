{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.user = {
    pkgs,
    lib,
    ...
  }: let
    modules = with self.nixosModules; [
      zsh
    ];
  in {
    imports = modules;
    users.users.mellow = {
      isNormalUser = true;
      initialPassword = "qwer";
      shell = pkgs.zsh;
      description = "mellow";
      extraGroups = [
        "root"
        "wheel"
        "networkmanager"
      ];
    };
  };
}
