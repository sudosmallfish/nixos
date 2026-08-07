{ self, inputs, ... }: {

	flake.nixosConfigurations.mainPC = inputs.nixpkgs.lib.nixosSystem {
		modules = [
			self.nixosModules.mainPC-Configuration
		];
	};
}
