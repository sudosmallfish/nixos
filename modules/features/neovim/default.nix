{
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.nvim = moduleWithSystem ({
    self',
    ...
  }: { 
    enviroment.systemPackages = [
      self'.packages.nvf
    ];
  });
  perSystem = {
    pkgs,
    lib,
    ...
  }: {
    packages = {
      vim = {
        theme = {
          enable = true;
          name = "catppuccin-mocha";
          style = "dark";
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        languages = {
          enableLSP = true;
          enableTreesitter = true;

          nix.enable = true;
        };
      };
    };
  };
}