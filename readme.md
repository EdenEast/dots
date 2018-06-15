# Dots

> The dotfiles for my personal windows and arch linux setup

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
# alias git to set the git-dir and work-tree
alias dots="git --git-dir$HOME/.dots --work-tree=$HOME"

# clone a bare repo into the .dots directory
dots clone --bare https://github.com/CruizeMissile/dots $HOME/.dots

# trying to checkout the repo. if there are no errors then you can update submodules. if not then backup
dots checkout

# if there are errors then you can back them up
mkdir $HOME/.dots-backup
dots checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I mv {} $HOME/.dots-backup/{}

# rerun checkout
dots checkout

# update submodules
dots submodule update --init --recursive $HOME
```

#### Issues
If you have upstream problems with origin/master like `fatal: ambiguous argument 'origin/master'`,
the problem could be the upstream setup. I found a solution to this problem [here](https://stackoverflow.com/a/26047558).
