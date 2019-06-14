### Setup
- need Ack, node, npm, mvim
- install Vundle
- install and compile YouCompleteMe
```shell
brew install cmake macvim
cd ~/.vim/bundle/YouCompleteMe

./install.py --clang-completer
```

```shell
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
- clone repo
- open vim and
```vim
:PluginInstall
```

- for prettier to work

```shell
cd ~/.vim/bundle/vim-prettier && npm install
```
