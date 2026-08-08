{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nvidiaDrivers = {
    pkgs,
    lib,
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

  	};
  };
}