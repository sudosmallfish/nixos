{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.core = {
    pkgs,
    ...
  }: let
    modules = with self.nixosModules; [
      user
      bootloader
      nix
      hardware
      location
    ];
  in {
    imports =
      [
        /etc/nixos/hardware-configuration.nix
      ]
      ++ modules;
    services = {
      openssh.enable = false;
      avahi.enable = false;
    };
    environment.systemPackages = with pkgs; [
      vim

    ];
    system.stateVersion = "26.05";
  };
}
