{
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.otter-launcher = moduleWithSystem ({self', ...}: {
    environment.systemPackages = [
      self'.packages.otter-launcher
    ];
  });
  perSystem = {
    pkgs,
    lib,
    self',
    inputs',
    ...
  }: {
    packages = {
      otter-launcher = let
        extra-config = ''
          [overlay]
          overlay_cmd = "${lib.getExe pkgs.kitty} +kitten icat --fit height --align left --no-trailing-newline ${./cat.png}"
           overlay_trimmed_lines = 0
        '';
    };
  };
}
