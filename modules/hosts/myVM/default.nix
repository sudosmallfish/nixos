{ self, inputs, ... }: {

	flake.nixosConfigurations.myVM = inputs.nixpkgs.lib.nixosSystem {
		modules = [
			self.nixosModules.myVMConfiguration
		];
	};
}
