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
		services.wivrn = {
			enable = true;
			steam.enable = true;
			autoStart = true;
			openFirewall = true;
		};
	});
}
