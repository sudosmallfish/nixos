{
	self,
  inputs,
  ...
}: {
  flake.nixosModules.bootloader = {
    pkgs,
    lib,
    ...
  }: {
    boot = {
      loader = {
        timeout = 5;
        efi.efiSysMountPoint = "/boot";
        efi.canTouchEfiVariables = true;
        grub = {
          enable = true;
			    device = "nodev";
			    useOSProber = false;
			    efiSupport = true;
        };      
      };

      plymouth = {
        enable = true;
        theme = "catppuccin-mocha";
        themePackages = with pkgs; [
          (catppuccin-plymouth.override {
            variant = "mocha";
          })
        ];
      };

      kernelPackages = pkgs.linuxPackages;

    };
  };
}
