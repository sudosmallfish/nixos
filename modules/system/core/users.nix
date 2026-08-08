# DO NOT PUSH TO GITHUB!!!
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
      zsh
    ];
  in {
    imports = modules;
    users.users.reece = {
      isNormalUser = true;     
      description = "reece";
      shell = pkgs.zsh;
      extraGroups = [ "root" "wheel" ];
      packages = with pkgs; [
				kdePackages.kate
				keepassxc
			];
    };
  };
}
