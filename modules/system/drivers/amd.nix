{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.amdDrivers = {
    pkgs,
    lib,
    ...
  }: {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
    services.xserver.videoDrivers = ["amd"];
  };
}
