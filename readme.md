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
