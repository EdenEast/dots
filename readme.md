# Dots

> the dotfiles for my personal windows and arch linux setup

My dot files only requires git to be installed. The files will be kept at their
intended locations, without making symlinks or copies.
This is handled by using git --bare repo.

There is a command called `dots`. This is a way that you can use git with the --bare repo. `dots add $HOME/.config/file` is a command example.

#### Alias
```bash
alias dots='git --git-dir=$HOME/.dots/ --work-tree=$HOME'
```

#### Setup
```bash
git init --bare $HOME/.dots
dots remote add origin https://github.com/CruizeMissile/dots.git
```

#### Installation
```bash
$ curl https://raw.githubusercontent.com/cruizemissile/dots/master/.scripts/install | bash
```

#### Manual Installation
```bash
alias dots='git --git-dir=$HOME/.dots/ --work-tree=$HOME'
dots clone --bare https://github.com/cruizemissile/dots $HOME/.dots
# There might be an error if you have changes then you cant check them out
dots checkout

# If you have an error then you can back them up
mkdir $HOME/.dots-backup
dots checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.dots-backup/{}

# then re-run checkout
dots checkout

# update submodules
dots submodule update --init --recursive $HOME
```
