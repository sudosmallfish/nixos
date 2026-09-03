{
  pkgs,
  lib,
  inputs,
  ...
}: {

  
  flake.nixosModules.minecraftServer = { self, pkgs, ... }: {

  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  # Minecraft server settings
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    servers.vanillaFabricServer = {
      enable = true;
      package = pkgs.fabricServers.fabric-26_2;
      jvmOpts = " -Xms22888M -Xmx22888M ";
      symlinks = { "mods" = ./mods; };
      serverProperties = {
						accepts-transfers = false;
						allow-flight = false;
						broadcast-console-to-ops = true;
						difficulty = "hard";
						enable-code-of-conduct = false;
						enable-jmx-monitoring = false;
						enable-query = false;
						enable-rcon = false;
						enable-status = true;
						enforce-secure-profile = true;
						enforce-whitelist = false;
						entity-broadcast-range-percentage = 100;
						force-gamemode = false;
						function-permission-level = 2;
						gamemode = "survival";
						generate-structures = true;
						generator-settings = true;
						hardcore = false;
						hide-online-players = false;
						initial-enabled-packs = "vanilla";
						level-name = "Slime Land";
						level-seed = "2917955049120349868";
						level-type = "minecraft\:normal";
						log-ips = true;
						management-server-enabled = false;
						max-chained-neighbor-updates = 1000000;
						max-players = 20;
						max-tick-time = 60000;
						max-world-size = 29999984;
						motd = "Welcome Slimes!";
						network-compression-threshold = 256;
						online-mode = true;
						op-permission-level = 4;
						pause-when-empty-seconds = 60;
						player-idle-timeout = 0;
						rate-limit = 0;
						region-file-compression = "deflate";
						server-port = 25565;
						simulation-distance = 18;
						spawn-protection = 0;
						status-heartbeat-interval = 0;
						sync-chunk-writes = true;
						text-filtering-version = 0;
						use-native-transport = true;
						view-distance = 16;
						white-list = false;
					};
      };
    };
  };
}
