{ 
  moduleWithSystem,
  ... 
  }: {
  flake.nixosModules.steam = moduleWithSystem ({ 
    pkgs, 
    unfreePkgs,
    lib, 
    ... 
    }: {
    programs.steam = {
      enable = true;
      protontricks.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  });
}