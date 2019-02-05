# dotfiles 2k19

![Preview](https://raw.githubusercontent.com/sphrak/dotfiles/master/assets/preview.png)

* dunst
* i3blocks
* i3
* neovim
* termite
* git

Color/theming is mostly [palemoon](https://github.com/drewtempelmeyer/palenight.vim) and or inspired by it.
`neovim` plugins depends on [vim-plug](https://github.com/junegunn/vim-plug)

### Install Dependencies
This kinda assumes a simple archlinux setup with `base` and `base-devel` available. YMMV.

```sh
$ pacman -S git gpg i3-gaps i3blocks neovim termite xorg xorg-xinit
```

### PSA
These are my personal dotfiles so `.gitconfig` is prepopulated
with my git stuff, so obviously you'd wanna change that.

### Setup dotfiles
To setup this on a new system simply clone it:
```sh
$ git clone ssh://git@github.com:sphrak/dotfiles.git ~/.dotfiles
```

.. and run the script:

```sh
$ cd ~/.dotfiles
$ ./install.sh
```

This will symlink the config files and directories. Any existing files
will be backed up to `~/.dotfiles/backup/$(date +%Y%M%d-%H%M%S)/`

### Updating
If you deploy the same way on each machine its simple to update
just commit your changes and 

### Existing installation
If you already have a system setup with existing configs -- this will 
move all existing files/folders into `~/.dotfiles/backup/`.
