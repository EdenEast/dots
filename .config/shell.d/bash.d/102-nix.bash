# if nix is installed then source profile
[[ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]] && {
    . $HOME/.nix-profile/etc/profile.d/nix.sh
}
