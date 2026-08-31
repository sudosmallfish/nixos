{
  self,
  moduleWithSystem,
  inputs',
  ...
}: {
  flake.nixosModules.programming = moduleWithSystem ({pkgs, inputs', ...}: {
    environment.systemPackages = with pkgs; [
      vscodium
      neovim
      git
      gnumake 
      gcc
      ripgrep
      fd
      tree-sitter
      unzip
      xclip
    ];

    programs.neovim.defaultEditor = true;

  });
}