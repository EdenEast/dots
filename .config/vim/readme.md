# [n]vim

> A big and complicated vim configuration setup

I have been using vim for about 5~6 years but only used it on and off. I would always switch back to something like
visual studio for c/c++ development and vscode for all others. Recently I have decided to switch to use vim/neovim for
everything. I always wanted to get better at vim but never spent the time to live in it. I am trying to put in the time
and invest into my workflow. Hard switching cold turkey is helping me take vim from my brain into my fingers. Also
taking the time to live in vim is making me find solutions to the rough edges of my workflow

## Table of Contents

<details>
<summary>Click here to show.</summary>

<!-- BEGIN-MARKDOWN-TOC -->

- [Workflow](#workflow)
    - [Operating System](#operating-system)
    - [Languages](#languages)
- [XDG Environment](#xdg-environment)
- [Resources](#resources)

<!-- END-MARKDOWN-TOC -->

</details>

This configuration is setup to work with vim, neovim, and neovim though vscode.
The configuration will try it's best to gracefully degrdate functionality if
the current flavor does not support the feature.

## Workflow

### Operating System

I work in the game industry. This means that I work primarly on windows (fml). On my personal setup I dual boot windows
and Arch. I have tried to make my vim setup work on both platforms.

On windows I use msys/mingw (git-bash) as it is impossible to work on cmd and powershell is just waaaaay to different
to my workflow. I would love to use neovim in my emulated bash environment but the tui does not work. This means that
the only option I have is to use nvim-qt.

As you would expect neovim just works on linix because long live linux!

### Languages

As a game develper I use primarly c/c++ for development. Most tools in windows are written in c#. Around a year ago I
learned rust. After learning rust I dont think I can ever go back to c/c++. C/C++ is dead to me after leaning rust.

## XDG Environment

I am a big advicate of adding your configuration files into some sort of dotfiles so you can clone your configuration
files on any machine you are on and you are all setup. I have a problem with how vim stores it's configuration files.
Vim does not follow the `$XDG_CONFIG_HOME` convention and has it's configuration files in `~/.vim` and `~/.vimrc` file. No
application should be cluttering my `$HOME` directory. There is a way to force vim to use a different location for it's
.vim folder. Setting $VIMINIT will run before vim startup.

```bash
# ~/.bashrc
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
```

When vim startup it will set the `.vimrc` file location to `~/.config/vim/vimrc` and then source it. In my vimrc file I have
added this location into the runtimepath.

```vim
set &runtimepath += "$HOME/.config/vim"
```

## Resources

- [wincent/wincent](https://github.com/wincent/wincent/tree/master/roles/dotfiles/files/.vim) a well rounded vim
    configuration with great degredation of settings. Also split up into files and optimizing loading times
- [johoo](https://github.com/jonhoo/configs) A rust open source contributor and all around great and simple setup. Great
    way to understand how to integrate rust into vim workflow and use it as my project editor
- [boost productivity in vim](https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/) A good article with
    useful tips to speed up vimj
