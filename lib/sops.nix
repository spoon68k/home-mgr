{ config, root, git-profile, ... }:

{
    sops.age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt"; 

    # restart services on change
    systemd.user = {
        startServices = "sd-switch";
        services.mbsync.Unit.After = [ "sops-nix.service" ];
    };

    # Git profile
    sops.secrets.git-profile = {
      sopsFile = "${root}/secrets/${git-profile}-git.conf";
      format = "binary";
      mode = "0600";
      path = "${config.xdg.configHome}/git/profile";
    };
}
