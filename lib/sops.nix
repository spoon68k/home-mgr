{ config, root, gitProfile, ... }: {

    sops.age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt"; 

    # restart services on change
    systemd.user = {
        startServices = "sd-switch";
        services.mbsync.Unit.After = [ "sops-nix.service" ];
    };

    # git profile
    sops.secrets.git-profile = {
      sopsFile = "${root}/secrets/${gitProfile}-git.conf";
      format = "binary";
      mode = "0600";
      path = "${config.xdg.configHome}/git/profile";
    };
}
