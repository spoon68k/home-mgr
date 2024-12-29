{ root, ... }: {

    home.file = {
        ".config/tmux" = { source = "${root}/dotfiles/tmux"; recursive = true; };
        ".config/nushell" = { source = "${root}/dotfiles/nushell"; recursive = true; };
        ".config/gitui" = { source = "${root}/dotfiles/gitui"; recursive = true; };
        ".config/hypr" = { source = "${root}/dotfiles/hypr"; recursive = true; };
        ".config/kitty" = { source = "${root}/dotfiles/kitty"; recursive = true; };
        ".config/waybar" = { source = "${root}/dotfiles/waybar"; recursive = true; };
        ".config/wofi" = { source = "${root}/dotfiles/wofi"; recursive = true; };
        ".config/nvim" = { source = "${root}/dotfiles/nvim"; recursive = true; };
        ".config/backgrounds" = { source = "${root}/dotfiles/backgrounds"; recursive = true; };

        ".config/git/config" = { source = "${root}/dotfiles/git/config"; };
        ".config/htop/htoprc" = { source = "${root}/dotfiles/htop/htoprc"; };
        ".config/foot/foot.ini" = { source = "${root}/dotfiles/foot/foot.ini"; };
        ".config/bat/config" = { source = "${root}/dotfiles/bat/config"; };
        ".config/k9s/config.yaml" = { source = "${root}/dotfiles/k9s/config.yaml"; };
    };
}
