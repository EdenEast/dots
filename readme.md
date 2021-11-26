# Dots

⚠️ This repository is deprecated . Configuration has moved to [nyx] managed in [nix]. ⚠️

[nyx]: https://github.com/edeneast/nyx
[nix]: https://nixos.org

---

> The dotfiles for my personal windows and arch linux setup

Dot files uses [yadm] as a manager. Note that iI havent commented / docuemnted most of the config. I will try my best to document when I can.

## Goals

- Cross platform working on windows, osx and linux.
- Attempt to adhear to XDG spe
- Everything is a plugin. Batteries are included but optional use
- Plugins check for requirements and disable if not met

## Installation

One line installation with curl.

```bash
curl -fsSL https://raw.github.com/edeneast/dots/master/.scripts/install | bash -s --
```

Manual installation with [yadm]

```bash
curl -fsSLO https://github.com/CruizeMissile/dots/raw/master/.local/bin/yadm
YADM_DIR="$HOME/.config/yadm" ./yadm clone --bootstrap https://github.com/edeneast/dots
```

[yadm]: https://thelocehiliosan.github.io/yadm

## Some Resources

- [How to encrypt dotfiles](https://abdullah.today/2019/10/01/encrypted-dotfiles.html) with keybase and gpg
- [conf.d like directories](https://chr4.org/blog/2014/09/10/conf-dot-d-like-directories-for-zsh-slash-bash-dotfiles/) for bash and zsh

## Examples

- [neeasade/dotfiles](https://github.com/neeasade/dotfiles) utilize a template based theming system, with the ability to
  to switch between themes without restarting programs
- [andschwa/dotfiles](https://github.com/andschwa/dotfiles) use git subtree and stow setup with private subtrees
- [dguo/dotfiles](https://github.com/dguo/dotfiles) interesting remap of caps lock, has all 3 platforms, good readme
- [xero/dotfiles](https://github.com/xero/dotfiles) well documented and extensive config
- [noctuid/dotfiles](https://github.com/noctuid/dotfiles) through documented readme; keyboard workflow
- [bspwm simple theme switcher](https://www.reddit.com/r/unixporn/comments/def9ez/bspwm_simple_theme_switcher/)
- [open box fool in the rain](https://www.reddit.com/r/unixporn/comments/8apait/openbox_fool_in_the_rain/)
- [clean and productive](https://www.reddit.com/r/unixporn/comments/aktm5d/i3gaps_clean_and_productive/)
- [actual minimal](https://www.reddit.com/r/unixporn/comments/crbv8i/bspwm_actually_minimal/)
- [openbox vinl](https://www.reddit.com/r/unixporn/comments/7djwht/openbox_vinyl/)
- [qtile space odyssey](https://www.reddit.com/r/unixporn/comments/dey3bl/qtile_space_odyssey/)
- [xmonad workspace](https://www.reddit.com/r/unixporn/comments/cmenre/xmonad_xmonord_update/)
- [xmonad_xmonord](https://www.reddit.com/r/unixporn/comments/c80q4h/xmonad_xmonord/)
- [xmonadminimal](https://www.reddit.com/r/unixporn/comments/al4yyy/xmonadminimal/)

## Themes

- [dreamlike](https://www.reddit.com/r/unixporn/comments/dkgomp/bspwm_dreamlike/)
- [efficiency](https://www.reddit.com/r/unixporn/comments/djrtdp/bspwm_efficiency/)
- [simplicity](https://www.reddit.com/r/unixporn/comments/djuz99/i3gaps_simplicity/)
- [warm and comfy](https://www.reddit.com/r/unixporn/comments/di9qkn/herbstluftwm_warm_and_comfy/)
- [slate](https://www.reddit.com/r/unixporn/comments/dhz0sj/i3gaps_slate/)
- [interesting pywal setup](https://www.reddit.com/r/unixporn/comments/djzs4o/i3gapsrounded_having_fun_again_with_pywal/)

## Rofi scripts

- [rofi menu scripts](https://gitlab.com/vahnrr/rofi-menus)
- [i3lock-color faster lockscreen](https://www.reddit.com/r/unixporn/comments/7iddwn/i3lock_faster_and_better_lockscreen/)

## Awesome

- [rounded](https://www.reddit.com/r/unixporn/comments/dmvcev/awesome_rounded/)
- [lines](https://www.reddit.com/r/unixporn/comments/dpy9wu/awesome_lines/)

## Herbsluftwm

- [singularity](https://www.reddit.com/r/unixporn/comments/dp5278/herbstluftwm_creamy_singularity/)

## 2bwm

- [doot](https://www.reddit.com/r/unixporn/comments/dq8xbs/2bwm_doot/)

## More reddit posts to save

- [kde nordic kwin](https://www.reddit.com/r/unixporn/comments/dncmja/kde_plasma_nordic_manjaro_gridtilingkwin/)
- [bspwm workflow](https://www.reddit.com/r/unixporn/comments/co4kan/bspwm_wallpaper_is_bloat/)
- [xmonad with lemonbar](https://www.reddit.com/r/unixporn/comments/4b96v0/xmonadlemonbar_dual_monitor_desktop_on_freebsd/)
- [xmonad theme switcher](https://www.reddit.com/r/unixporn/comments/6rwqnh/xmonad_ive_been_working_on_this_one_for_a_while/)
- [nice lemonbar and 2bwm](https://www.reddit.com/r/unixporn/comments/a7f1oa/2bwmlemonbar_light_rice/)
- [bspwm and powerline lemonbar](https://www.reddit.com/r/unixporn/comments/bni61i/bspwm_a_powerline_attempt_in_lemonbar/)
- [bspwm clickable lemonbar](https://www.reddit.com/r/unixporn/comments/b12d3s/bspwm_add_button_clicked_lemonbar/)
