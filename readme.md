# Dots

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
curl -fsSL https://raw.github.com/cruizemissile/dots/master/.scripts/install | bash -s --
```

Manual installation with [yadm]

```bash
curl -fsSLO https://raw.github.com/TheLocehiliosan/yadm/master/yadm
./yadm clone --bootstrap https://github.com/cruizemissile/dots
```

[yadm]: https://thelocehiliosan.github.io/yadm

## Some Resources

- [How to encrypt dotfiles](https://abdullah.today/2019/10/01/encrypted-dotfiles.html) with keybase and gpg
- [conf.d like directories](https://chr4.org/blog/2014/09/10/conf-dot-d-like-directories-for-zsh-slash-bash-dotfiles/)
    for bash and zsh

## Examples

- [neeasade/dotfiles](https://github.com/neeasade/dotfiles) utilize a template based theming system, with the ability to
    to switch between themes without restarting programs
- [andschwa/dotfiles](https://github.com/andschwa/dotfiles) use git subtree and stow setup with private subtrees
- [dguo/dotfiles](https://github.com/dguo/dotfiles) interesting remap of caps lock, has all 3 platforms, good readme
- [xero/dotfiles](https://github.com/xero/dotfiles) well documented and extensive config
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
