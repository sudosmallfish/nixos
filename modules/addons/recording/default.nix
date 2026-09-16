{
  self,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.recording = moduleWithSystem ({pkgs, ...}: {
    programs.obs-studio.enable = true;
    environment.systemPackages = with pkgs; [
		audacity
    ];
  });
}
