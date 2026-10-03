{ 
	self, 
	inputs,
	lib,
	... 
}: {

	flake.nixosModules.toastPC-Configuration = {pkgs, ... }:
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

		networking.hostName = "mainPC";
		networking.networkmanager.enable = true;
		environment.systemPackages = with pkgs; [
			brave
			(pkgs.spotify-spotx.override {
				spotxArgs = [
				"-h"
				"-p"
				];
			})
		];

		services.displayManager.sddm = {
			enable = true;
			autoNumlock = true;
			theme = "sddm-astronaut-theme";
			extraPackages = [ pkgs.sddm-astronaut ];
		};

		console.useXkbConfig = true;
		services.xserver.xkb = {
		  layout = "us";
		};

		services.desktopManager.plasma6.enable = true;

		imports = modules;
		users.users.toaster = {
			isNormalUser = true;
			description = "A Random Toaster";
			shell = pkgs.fish;
			extraGroups = [ "root" "wheel" ];
			packages = with pkgs; [
				keepassxc
				vscodium
				vesktop	
			];
		};
		networking.firewall = {
			enable = true;
			allowedTCPPorts = [
				27036
				27037
			];
			allowedUDPPorts = [
				27031
				27036
				10400
				10401
			]; 
		};
	};
}
