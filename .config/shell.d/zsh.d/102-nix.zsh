# if nix is installed then source profile
[[ -e /home/eden/.nix-profile/etc/profile.d/nix.sh ]] && {
    . /home/eden/.nix-profile/etc/profile.d/nix.sh;
}
