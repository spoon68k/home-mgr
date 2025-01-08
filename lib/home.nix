{ pkgs, home, username, ... }: {

    home.username = username;
    home.homeDirectory = "/${home}/${username}";
    home.stateVersion = "23.11";
    news.display = "silent";
    xdg.enable = true;

}
