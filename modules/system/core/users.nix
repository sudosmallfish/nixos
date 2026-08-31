{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.user = {
    pkgs,
    lib,
    ...
  }: let
    modules = with self.nixosModules; [
      fish
    ];
  in {
    imports = modules;
    users.users.reece = {
      isNormalUser = true;     
      description = "reece";
      shell = pkgs.fish;
      extraGroups = [ "root" "wheel" ];
      packages = with pkgs; [
				kdePackages.kate
				keepassxc
			];
    };
    
  };
}
