{
    self,
    moduleWithSystem,
    ...
}: {
    flake.nixosModules.extra = moduleWithSystem ({ 
      pkgs, 
      ... 
    }: {
    programs.localsend.enable = true;
    programs.dms-shell.enableAudioWavelength = true;
    services.flatpak.enable = true;

    environment.systemPackages = with pkgs; [
      fastfetch
      cava
      kurve
      htop
      mpv
      qalculate-qt
      gparted-full
    ]; 
  });
}
