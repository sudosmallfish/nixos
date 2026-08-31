{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.bibataCursors = {
    pkgs,
    lib,
    ...
  }: let
  in {
    fonts.packages = with pkgs.nerd-fonts; [
      space-mono
    ];
    environment.systemPackages = with pkgs; [
      bibata-cursors
    ];

    environment.variables = {
      XCURSOR_THEME = "Bibata-Modern-Ice";
      XCURSOR_SIZE = "20";
    };

    programs.dconf.profiles.user.databases = [
      {
        lockAll = false;
        settings = {
          "org/gnome/desktop/interface" = {
            cursor-theme = "Bibata-Modern-Ice";
            font-name = "SpaceMono Nerd Font 11";
          };
        };
      }
    ];
  };
}
