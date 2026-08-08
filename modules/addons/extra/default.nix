{
    self,
    moduleWithSystem,
    ...
}: {
    flake.nixosModules.extra = moduleWithSystem ({ 
    pkgs, 
    ... 
  }: {...}: let
    modules = with self.nixosModules; [
      woomer
      otter-launcher
    ];
  in {
    imports = modules;
    environment.systemPackages = with pkgs; [
      fastfetch
      cava
      htop

    ]; 
  });
}