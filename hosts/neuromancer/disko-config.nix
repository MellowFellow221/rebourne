{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "512M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                subvolumes = {
                  "@" = {
                    mountpoint = "/";
                  };
                  "@home" = {
                    mountpoint = "/home";
                    mountOptions = [ "compress=zstd" ];
                  };
                  "@nix" = {
                    mountpoint = "/nix";
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                  };
                  "@var" = {
                    mountpoint = "/var";
                  };
                  "@swap" = {
                    mountpoint = "/.swap";
                    swap = {
                      swapfile = {
                        size = "32G";
                      };
                    };
                  };
                };
              };
            };
          };
        };
      };

      data = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            data = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                mountpoint = "/backup";
                mountOptions = [ "compress=zstd" ];
              };
            };
          };
        };
      };

      backup = {
        type = "disk";
        device = "/dev/sdb";
        content = {
          type = "gpt";
          partitions = {
            backup = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                mountpoint = "/data";
                mountOptions = [ "compress=zstd" ];
              };
            };
          };
        };
      };

    };
  };
}
