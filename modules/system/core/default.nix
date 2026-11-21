{self, ...}: {
  flake.nixosModules.core = {pkgs, ...}: let
    modules = with self.nixosModules; [
      user
      bootloader
      nix
      imports
      locale
    ];
  in {
    imports =
      [
        /etc/nixos/hardware-configuration.nix
      ]
      ++ modules;

    services = {
      openssh = {
        enable = true;
				settings = {
				 PermitRootLogin = "yes";
				};
      };
      avahi.enable = true;
    };
    environment.systemPackages = with pkgs; [
      vim
      usbutils
      wget
    ];
    system.stateVersion = "26.05";
  };
}
