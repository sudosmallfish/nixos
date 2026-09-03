{
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.fish = moduleWithSystem ({
    pkgs,
    self',
    ...
  }: {

    programs.fish = {
      enable = true;
      shellInit = "";
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';

    };
    users.defaultUserShell = pkgs.fish;
    programs.atuin = {
      enable = true;
      enableFishIntegration = true;
    };
  });
  perSystem = {
    pkgs,
    lib,
    ...
  }: {
    packages.fish = inputs.wrappers.wrappers.fish.wrap {
      plugins = [
        pkgs.fishPlugins.fzf
      ];
      shellAliases = {
        ls = "${lib.getExe pkgs.lsd} -l";
        cat = lib.getExe pkgs.bat;
      };      
    };
  };
}