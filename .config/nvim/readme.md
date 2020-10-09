# Neovim

> An over engineered and complicated [n]vim configuration

This is a highly customized vim configuration that is built to work on most vim/neovim environments.
I work on many machines with many different environments. This configuration is meant to be self
contained. I have made a conscience effort to switch all my editors to vim. At work I must use
windows. This means that my configuration must support a windows work flow (nvim-qt/neovide as nvim
crashes in mintty). At home I use arch linux and windows.

## Table of Contents

<details>
<summary>Click here to show.</summary>

- [Features](#features)
- [workflow](#workflow)
  - [Operating Systems](#operating-system)
  - [Languages](#languages)
- [Vim and Neovim](#vim-and-neovim)
- [XDG Environment](#xdg-environment)
- [References/Resources](#references-and-resources)

</details>

## Features

- [x] Fast search and navigation with [fzf], [ripgrep], [vim-clap]
- [x] Interactive language server support with [coc]
- [x] Easy pneumonic leader keybinding and mapping viewer with [which-key]
- [x] Neovim and vim configuration with graceful degradation

[coc]: https://github.com/neoclide/coc.nvim
[fzf]: https://github.com/junegunn/fzf
[ripgrep]: https://github.com/BurntSushi/ripgrep
[vim-clap]: https://github.com/liuchengxu/vim-clap
[which-key]: https://github.com/liuchengxu/vim-which-key

## Workflow

### Operating System

I work in an industry and requires me to work on windows as my primary workstation (fml). This means
that my main use-case for vim is on windows. This comes with some problems that I have tried to
address. First off, it is impossible to use windows cmd/dos/batch terminal and powershell has too
many warts that I don't like using as my primary shell to live in. This means that I have to emulate
bash. To do this I use mingw or msys. I flip flop between the two but this is the terminal emulator
that I live in. This causes a problem with nvim on windows. Currently nvim crashes in mintty. This
means that I have to run nvim in a gui application form like [nvim-qt] or [neovide].

As you might expect nvim just works on my arch linux setup because linux is love and linux is life.

[nvim-qt]: https://github.com/equalsraf/neovim-qt
[neovide]: https://github.com/Kethku/neovide

### Languages

When it comes to programming languages I am a polyglot. I primarily write C/C++, C#, Typescript
(Angular web stack), and powershell at work. At home I primarily write Rust and automate my life with
bash scripts. Rust is the language that I fell in love with after learning it. I have tried to
replace everything I do with other compiled languages and write it in rust. C++ is dead to me.

## Vim and Neovim

For the most part the default configuration directory for neovim will be `$HOME/.config/nvim` but
for other use cases like on windows this is not the case. Souring the file
`$HOME/.config/nvim/init.vim` should bootstrap all the runtimepath issues and work out of the box.
This is why my .vimrc file sources this file.

## XDG Environment

I am a big advocate of adding your configuration files into a dotfiles repository so you can clone
your configuration onto any machine you have to work on. There is one problem I have with how
vanilla vim stores it's configuration files. vim does not follow the `$xdg_config_home` convention
and has it's configuration files in `~/.vim` and `~/.vimrc` file. no application should be
cluttering my `$home` directory. This has not been a problem since I have switched to use neovim as
my primary flavor of vim, but if I do not have neovim for whatever reason (*mintty on windows*) I
still been to use vim.

There is a way to force vim to use a different location for it's .vim folder. There is an environment
variable called `$VIMINIT`. This value will be executed as an Ex mode command. See [`:h
VIMINIT`][viminit].

```bash
# ~/.bashrc
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
```

When vim startup it will set the `.vimrc` file location to `~/.config/vim/vimrc` and then source it. In my vimrc file I have
added this location into the runtimepath.

```vim
set &runtimepath += "$HOME/.config/vim"
```

[viminit]: http://vimdoc.sourceforge.net/htmldoc/starting.html#VIMINIT

## References and Resources

- [wincent/wincent][wincent] a well rounded vim config with great degrading of settings. Also ansible setup
- [jonhoo/config][jonhoo] A rust open source contributor great rust setup.
- [hardcoreplayers/thinkvim][thinkvim] An interesting vim distribution with good settings and organization
- [zenbro/dotfiles][zenbro] The idea of the bundle folder came from this when I saw that you can define Plug import and settings together
- [faerryn/fey_neovim][fey_neovim] Configuration completely written in lua with module organization
- [tjdevries/config_manager][tjdevries] Nvim core member with nvim configuration with lua and built in lsp
- [lucaslollobrigida/dotfiles][lucaslollobrigida] Interesting transition between coc and nvim-lsp. Also uses packer

[wincent]: https://github.com/wincent/wincent/tree/0d0b647/roles/dotfiles/files/.vim
[jonhoo]: https://github.com/jonhoo/configs/tree/617ff2f/editor/.config/nvim
[thinkvim]: https://github.com/hardcoreplayers/ThinkVim/tree/c56462c/
[zenbro]: https://github.com/zenbro/dotfiles/blob/d3f4bd3/.nvimrc
[fey_neovim]: https://github.com/faerryn/fey_neovim
[tjdevries]: https://github.com/tjdevries/config_manager/tree/3053ed9/xdg_config/nvim
[lucaslollobrigida]: https://github.com/lucaslollobrigida/dotfiles/tree/7f3a268/vim/.config/nvim
