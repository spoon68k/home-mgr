{ settings, pkgs, ... }: 

let
  username = settings.username;

in {

  programs.zsh = {
    enable = true;
    history = {
      size = 1000;
    };
    loginExtra = ''
      if ! pgrep -q -x "ssh-agent"; then
	eval $(ssh-agent)
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
