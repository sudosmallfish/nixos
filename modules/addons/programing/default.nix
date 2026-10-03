{
  self,
  moduleWithSystem,
  inputs',
  ...
}: {
  flake.nixosModules.programing = moduleWithSystem ({pkgs, inputs', ...}: {
    environment.systemPackages = with pkgs; [
      neovim
      git
      gnumake 
      gcc
      ripgrep
      fd
      tree-sitter
      unzip
      xclip
      wl-clipboard
      lua-language-server
      nixd
      stylua
    ];

    programs.neovim.defaultEditor = true;
    environment.variables.EDITOR = "";
  });
}
