#### prerequisite:
*Ack,
git,
npm install -g prettier,
node,
npm,
mvim,
source code pro font*

### Setup
- install Vundle

```shell
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

- install vim plugins

```vim
:PluginInstall
```

- install and compile YouCompleteMe

```shell
brew install cmake macvim
cd ~/.vim/bundle/YouCompleteMe

./install.py --clang-completer
```

- for prettier to work

```shell
cd ~/.vim/bundle/vim-prettier && npm install
```

- Download and install font:
[Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro?selection.family=Source+Code+Pro)

- install fd & fzf & keybindings
```shell
brew install fd
brew install fzf
$(brew --prefix)/opt/fzf/install
```

- Setting fd as the default source for fzf
```zshrc
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
```
