{ self, inputs, ... }: {

	flake.nixosModules.myMachineConfiguration = { pkgs, lib, ... }: {
		imports = [
			self.nixosModules.myMachineHardware
			self.nixosModules.niri
		];

		nix.settings.experimental-features = [ "nix-command" "flakes" ];

		boot.loader.grub.enable = true;
		boot.loader.grub.device = "/dev/sda";
		boot.loader.grub.useOSProber = true;

		networking.hostName = "nixos";
		networking.networkmanager.enable = true;

  		time.timeZone = "America/Denver";

		i18n.defaultLocale = "en_US.UTF-8";

		i18n.extraLocaleSettings = {
    			LC_ADDRESS = "en_US.UTF-8";
    			LC_IDENTIFICATION = "en_US.UTF-8";
    			LC_MEASUREMENT = "en_US.UTF-8";
    		LC_MONETARY = "en_US.UTF-8";
    			LC_NAME = "en_US.UTF-8";
    			LC_NUMERIC = "en_US.UTF-8";
    			LC_PAPER = "en_US.UTF-8";
    			LC_TELEPHONE = "en_US.UTF-8";
    			LC_TIME = "en_US.UTF-8";
  		};
	
		#services.desktopManager.gnome.enable = true;

		#services.xserver.enable = true;
		#services.xserver.desktopManager.xfce = {
			#enable = true;
			#enableXfwm = true;
			#enableWaylandSession = true;
			#waylandSessionCompositor = "niri";
		#};

		console.useXkbConfig = true;
  		services.xserver.xkb = {
    			layout = "us";
    			variant = "dvp";
		};

  		users.users."reece" = {
    			isNormalUser = true;
    			description = "Reece";
    			extraGroups = [ "networkmanager" "wheel" ];
    			packages = with pkgs; [];
  		};

 	 	nixpkgs.config.allowUnfree = true;

		environment.systemPackages = with pkgs; [
			librewolf
			obsidian
		];									

		programs.neovim = {
			defaultEditor = true;
			enable = true;
			vimAlias = true;
		};

  		system.stateVersion = "26.05"; # Did you read the comment?


	};

}
