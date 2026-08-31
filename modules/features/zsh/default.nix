{
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.zsh = moduleWithSystem ({
    pkgs,
    self',
    ...
  }: {

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableBashCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      histSize = 10000;
      shellInit = "fastfetch";
    };
    users.defaultUserShell = pkgs.zsh;

  });
}