{
  self,
  moduleWithSystem,
  ...
}: {
	flake.nixosModules.toast = moduleWithSystem ({unfreePkgs, ...}: {
		environment.systemPackages = with unfreePkgs; [
			wayvr
			unityhub
			blender
		];
	});
}
