{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.network = {
    pkgs,
    lib,
    ...
  }: {
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [
        53317
        993
        465
      ];
      allowedUDPPorts = [
        53317
        993
        465
      ]; 
    };

    

  };
}
