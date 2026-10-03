{
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.starship = moduleWithSystem ({
    ...
  }: {

    programs.starship = {
      enable = true;
      presets = [ "nerd-font-symbols" "catppuccin-powerline" ];
    };
  });
}
