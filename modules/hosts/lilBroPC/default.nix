{ self, inputs, ... }: {

	flake.nixosConfigurations.lilBroPC = inputs.nixpkgs.lib.nixosSystem {
		modules = with self.nixosModules; [
			lilBroPC-Configuration
			audio
			core
			amdDrivers
			bottles
			gaming
			programing
			office
			kitty
			network
			unfree
			extra
			starship
		];
	};
}
