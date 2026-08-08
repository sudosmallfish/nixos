{ 
	self, 
	inputs, 
	... 
}: {

	flake.nixosModules.mainPC-Configuration = {pkgs, ... }: {
		

		networking.hostName = "mainPC";

		networking.networkmanager.enable = true;

	  services.displayManager.sddm.enable = true;
  	services.desktopManager.plasma6.enable = true;


		environment.systemPackages = with pkgs; [
			librewolf
		];

	};

}
