{ lib, pkgs, ... }:

{
  services.foldingathome = {
    enable = true;
    user = "MellowFellowAU";
    team = 236565;
  };

  # This block overrides the default module settings
  systemd.services.foldingathome = {
    serviceConfig = {
      # Fix dynamic user issue
      DynamicUser = lib.mkForce false;
      
      # Since DynamicUser is off, ensure it runs as the user defined in your services.foldingathome.user
      User = "mellow";
      Group = "users";
    };
  };
}
