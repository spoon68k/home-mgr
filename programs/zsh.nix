{ pkgs, ... }: {

    programs.zsh = {
        enable = true;
        history = {
            size = 1000;
        };
        loginExtra = ''
            if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
                . "$HOME/.nix-profile/etc/profile.d/nix.sh"
            fi

            eval $(ssh-agent) 1>/dev/null

            if [ -f ~/.ssh/ed25519.key ]; then
                ssh-add ~/.ssh/ed25519.key 1>/dev/null 2>&1
            fi

            any-nix-shell zsh --info-right | source /dev/stdin
        '';
        oh-my-zsh = {
            enable = true;
        };
        plugins = [
        {
            name = "zsh-ssh-agent";
            src = pkgs.fetchFromGitHub {
                owner = "ohmyzsh";
                repo = "ohmyzsh";
                rev = "b4f9698733d7b29cc495e649e26fd6c3a5dcfcae";
                sha256 = "sha256-yvsNYoptmmm3BJeOdyt7zGuayYroraiiumOio9eZZ74=";
            };
        }];
    };

    home.sessionVariables = {
        SHELL = "${pkgs.zsh}/bin/zsh";
    };

}
