{
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.kitty = moduleWithSystem (
    {self'}: {
      environment.systemPackages = with self'.packages; [
        kitty
      ];
    }
  );
  perSystem = {pkgs, ...}: {
    packages.kitty = let
      space-mono = pkgs.nerd-fonts.space-mono;
      fontsConf = pkgs.makeFontsConf {
        fontDirectories = [space-mono];
      };
    in
      inputs.wrappers.wrappers.kitty.wrap {
        inherit pkgs;
        environment = {
          "FONTCONFIG_FILE" = "${fontsConf}";
        };
        font = {
          name = "SpaceMono Nerd Font Mono";
          size = 11;
        };
        settings = {
          font_size = 10;
          scrollbar = "never";
          pixel_scroll = false;
          window_padding_width = 9;
          background_opacity = 0.80;
          confirm_os_window_close = 0;
          enable_audio_bell = false;
          cursor_trail = 1;
          cursor_trail_start_threshold = 1;
          cursor_trail_color = "#931a7a";
          cursor_shape = "beam";
          allow_remote_control = false;
        };
        keybindings = {
          "ctrl+backspace" = "send_text all \\x17";
        };
        themeFile = "Catppuccin-Mocha";
      };
  };
}
