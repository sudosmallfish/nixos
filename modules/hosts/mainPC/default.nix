{ self, inputs, ... }: {

	flake.nixosConfigurations.mainPC = inputs.nixpkgs.lib.nixosSystem {
		modules = with self.nixosModules; [
			mainPC-Configuration
			audio
			core
			nvidiaDrivers
			bottles
			gaming
			programming
			office
			kitty
			network
			unfree
			extra
			starship
		];
	};
}
