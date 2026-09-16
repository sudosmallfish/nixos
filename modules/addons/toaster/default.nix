{
  self,
  moduleWithSystem,
  ...
}: {
	flake.nixosModules.toast = moduleWithSystem ({pkgs, ...}: {
		environment.systemPackages = with pkgs; [
			wayvr
			unityhub
			blender
		];
	});
}
