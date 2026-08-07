{ self, inputs, ... }: {

	flake.nixosModules.myVMHardware = { config, lib, pkgs, modulesPath, ... }: {
  		imports = [ 
			(modulesPath + "/installer/scan/not-detected.nix")
		];

  		boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "sd_mod" "sr_mod" ];
  		boot.initrd.kernelModules = [ ];
  		boot.kernelModules = [ ];
  		boot.extraModulePackages = [ ];

  		fileSystems."/" = {
    			device = "/dev/disk/by-uuid/c1010119-3018-4738-9dda-8133c21fbc8a";
      			fsType = "ext4";
   		};

  		swapDevices = [ ];

			nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  		virtualisation.virtualbox.guest.enable = true;
	};
}
