{ moduleWithSystem, ... }: {

  flake.nixosModules.steam = moduleWithSystem ({ pkgs, lib, ... }: {

    programs.steam = {

      enable = true;
      protontricks.enable = true;

    };
  })
};