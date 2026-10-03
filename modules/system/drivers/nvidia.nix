{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nvidiaDrivers = {
    pkgs,
    lib,
    config,
    ...
  }: {
    
    hardware.graphics = {
			enable = true;
			enable32Bit = true;
		};

		services.xserver.videoDrivers = ["nvidia"];

  	hardware.nvidia = {

			# Nvidia power management. Experimental, and can cause sleep/suspend to fail.
			# Enable this if you have graphical corruption issues or application crashes after waking
			# up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
			# of just the bare essentials.
			powerManagement.enable = true;

      modesetting.enable = true;
			open = true;
			nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "610.57.04";
        sha256_64bit = "sha256-suk1xmuDuwDAyFe8jg7g/VLekoa0DJzB7sKafOfrEW0=";
        sha256_aarch64 = "sha256-QCefrMBCmpOwuOyXv1k5Gj0iB2CYlPgnG3JToUw/j54=";
        openSha256 = "sha256-rQHOOOY4KL92Ww3KDwh+j4eGU7oNAH8LutZC5wmFnPo=";
        settingsSha256 = "sha256-ZEMo8I8Zc2Tq6RVDNYpAH+f094dUaZiBqO+5f6lIjRI=";
        persistencedSha256 = "sha256-aXmD2VY1RLlgAnlHhOUMWzvMyhI6JTClcFLm4imF/mA=";
      };
    };
  };
}
