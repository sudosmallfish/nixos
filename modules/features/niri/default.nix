{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
    environment.systemPackages = with pkgs; [ 
      xwayland-satellite # xwayland support
    ];
  };

  perSystem = { pkgs, lib, self', ... }: {
		
    packages.myNiri = inputs.wrappers.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)
	      ];
        input = {
          focus-follows-mouse = _: {};
          keyboard = {
            numlock = true;
            xkb.layout = "us";
            xkb.variant = "dvp";
          };
        };
        gestures.hot-corners = {
          off = _: { };
        };
        layout.gaps = 5;
        prefer-no-csd = true;
        outputs = {
          "DP-3" = {
            mode = "2560x1440@300.002";
          };
          "HDMI-A-1" = {
            mode = "1920x1080@60.000";
            transform = "90";
            layout = {
              default-column-width = [ { proportion = 1.0; } ];
            };
          };
        };
        layout = { 
          preset-window-heights = [
            { proportion = 0.33333; }
            { proportion = 0.66667; }
            { proportion = 1.0; }
          ];
          preset-column-widths = [
            { proportion = 0.33333; }
            { proportion = 0.5; }
            { proportion = 0.66667; }
          ];
          focus-ring = {
            active-color = "#931a7a";
          };
        };
        binds = {
          "Mod+S".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
	        "Mod+Return".spawn-sh = lib.getExe self'.packages.kitty;
          "Mod+B".spawn-sh = "librewolf";
          "Mod+K".spawn-sh = "keepassxc";
          "Mod+M".spawn-sh = "spotify";
          "Mod+C".spawn-sh = "qalculate-qt";
          "Mod+G".spawn-sh = "steam";
	        "Mod+Q".close-window = _:{};
          "Mod+D".focus-column-left = _: {};
          "Mod+N".focus-column-right = _: {};
          "Mod+Ctrl+D".move-column-left = _: {};
          "Mod+Ctrl+N".move-column-right = _: {};
          "Mod+Shift+N".focus-monitor-right = _: {};
          "Mod+Shift+D".focus-monitor-left = _: {};
          "Mod+T".focus-workspace-up = _: {};
          "Mod+H".focus-workspace-down = _: {};
          "Mod+Shift+F".fullscreen-window = _: {};
          "Mod+F".maximize-column = _: {};
          "Mod+R".switch-preset-column-width = _: {};
          "Mod+Shift+R".switch-preset-window-height = _: {};
          "Mod+WheelScrollDown".focus-column-right = _: {};
          "Mod+WheelScrollUp".focus-column-left = _: {};
          "XF86AudioPrev".spawn = [ "playerctl" "previous" ];
          "XF86AudioPlay".spawn = [ "playerctl" "play-pause" ];
          "XF86AudioNext".spawn = [ "playerctl" "next" ];
          "XF86AudioMute".spawn = [ "wpctl" "set-mute" "@DEFAULT_SINK@" "toggle" ];
	      };
      };
    };
  };

}
