{ 
	self, 
	inputs,
	lib,
	... 
}: {

	flake.nixosModules.mainPC-Configuration = {pkgs, ... }: {
		
		environment.sessionVariables.NIXOS_OZONE_WL = "1";

		nixpkgs = {
			config.allowUnfreePredicate =
			pkg:
			builtins.elem (lib.getName pkg) [
				"spotify"
				"spotify-spotx"
			];
			overlays = [ inputs.spotx-nix.overlays.default ];		
		};

		networking.hostName = "mainPC";
		networking.networkmanager.enable = true;
		environment.systemPackages = with pkgs; [
			librewolf
			sddm-astronaut
			brave
			foliate
			transmission_4
			transmission_4-qt
			(pkgs.spotify-spotx.override {
				spotxArgs = [
				"-h"
				];
			})
		];

		services.printing = {
			enable = true;
			browsed.enable = true;
		};

		services.displayManager.sddm = {
			enable = true;
			autoNumlock = true;
			theme = "sddm-astronaut-theme";
			extraPackages = [ pkgs.sddm-astronaut ];
		};
		services.desktopManager.plasma6.enable = true;

		

	};
}
