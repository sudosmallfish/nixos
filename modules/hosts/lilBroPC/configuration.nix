{ 
	self, 
	inputs,
	lib,
	... 
}: {

	flake.nixosModules.lilBroPC-Configuration = {pkgs, ... }:
	let
		modules = with self.nixosModules; [ fish ];
	in {

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

		networking.hostName = "lilBroPC";
		networking.networkmanager.enable = true;
		environment.systemPackages = with pkgs; [
			librewolf
			sddm-astronaut
			brave
			foliate
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

		imports = modules;
		users.users.reece = {
			isNormalUser = true;
			description = "reece";
			shell = pkgs.fish;
			extraGroups = [ "root" "wheel" ];
			packages = with pkgs; [
				keepassxc
			];
		};
	};
}
