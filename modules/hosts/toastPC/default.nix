{ self, inputs, ... }: {

	flake.nixosConfigurations.toastPC = inputs.nixpkgs.lib.nixosSystem {
		modules = with self.nixosModules; [
			toastPC-Configuration
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
			recording
		];
	};
}
