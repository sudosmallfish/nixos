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

    environment.systemPackages = with pkgs; [
      fastfetch
      cava
      kurve
      htop
      mpv
    ]; 
  });
}