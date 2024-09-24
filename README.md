# Home-Mgr

This repository is for managing my dotfiles, scripts and program setups using Nix and Home-Manager.

Note to ensure that `zsh` is the default shell on non-NixOS systems:

- Add `$HOME/.nix-profile/bin/zsh` to `/etc/shells`
- Run: `chsh -s "$HOME/.nix-profile/bin/zsh" <username>`
