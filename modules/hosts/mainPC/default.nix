{ self, inputs, ... }: {

	flake.nixosConfigurations.mainPC = inputs.nixpkgs.lib.nixosSystem {
		modules = with self.nixosModules; [
			mainPC-Configuration
			core
			nvidiaDrivers
			bottles
			gaming
			programming
			office
			kitty
		];
	};
}
