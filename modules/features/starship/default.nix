{
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.starship = moduleWithSystem ({
    pkgs,
    self',
    ...
  }: {

    programs.starship = {
      enable = true;
      presets = [ "catppuccin-powerline" ];
    };
  });
}