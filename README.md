## Install

__Clone the Repo:__

```sh
git clone --recursive git@github.com:andyjac/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

__Run MacOS Customizations:__

```sh
./macos.sh
```

__Run Installer Scripts:__

```sh
./install
```

If you want to exclude specific installers, you can do so with the `--without <package>` flag. For example:

```sh
./install --without devtools
```

You can include this flag for as many packages as you want to exclude:

```sh
./install --without devtools --without zsh --without python
```

If you want to only install 1 package, you can do so with the `--only <package>` flag. For example:

```sh
./install --only emacs
```
