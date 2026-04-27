{ pkgs, hostname, ... }:
{

  networking.hostName = hostname;

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    # Automatic garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-generations +5"; # Keep 5 generations
      randomizedDelaysec = "45min";
      persistant = true;
    };
  };

  # Set your time zone and internationalisation properties
  time.timeZone = "Australia/Sydney";
  i18n = {
    defaultLocale = "en_AU.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_AU.UTF-8";
      LC_IDENTIFICATION = "en_AU.UTF-8";
      LC_MEASUREMENT = "en_AU.UTF-8";
      LC_MONETARY = "en_AU.UTF-8";
      LC_NAME = "en_AU.UTF-8";
      LC_NUMERIC = "en_AU.UTF-8";
      LC_PAPER = "en_AU.UTF-8";
      LC_TELEPHONE = "en_AU.UTF-8";
      LC_TIME = "en_AU.UTF-8";
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    btop
  ];

  users.users.mellow = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
