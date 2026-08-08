{
  self,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.programming = moduleWithSystem ({pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      vscodium
      neovim
      git

    ];

  });
}