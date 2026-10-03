{ self, inputs, ... }: {

	flake.nixosConfigurations.toastPC = inputs.nixpkgs.lib.nixosSystem {
		modules = with self.nixosModules; [
			toastPC-Configuration
			audio
			core
			programing
			nvidiaDrivers
			bottles
			gaming
			office
			kitty
			network
			unfree
			extra
			starship
			recording
			toast
		];
	};
}
