{ self, inputs, ... }: {

	flake.nixosModules.myVMConfiguration = { pkgs, lib, ... }: {
		imports = [
			self.nixosModules.myVMHardware
			self.nixosModules.niri
		];

		nix.settings.experimental-features = [ "nix-command" "flakes" ];



	};

}
