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
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
```
- map CAPS-LOCK to esc & ctrl (when hold)
- install karabiner-elements with brew or download from [karabiner-elements](https://pqrs.org/osx/karabiner/)
```
brew cask install karabiner-elements
```

- 1. create a new file called *custom-capslock.json* and paste the following text into it:
[medium guide: how to map capslock to escape on mac](https://medium.com/@pechyonkin/how-to-map-capslock-to-control-and-escape-on-mac-60523a64022b)
```custom-capslock.json
{
  "title": "Change caps_lock to Esc and Control",
  "rules": [
	{
	  "description": "Post Esc if Caps is tapped, Control if held.",
	  "manipulators": [
        {
    "type": "basic",
    "from": {
        "key_code": "left_control",
        "modifiers": {
            "optional": [
                "any"
            ]
        }
    },
    "to": [
        {
            "key_code": "left_control",
            "lazy": true
        }
    ],
    "to_if_alone": [
        {
            "key_code": "escape"
        }
    ]
}
	  ]
	}
  ]
}
```
- 2. save the file and put it into  **~/.config/karabiner/assets/complex_modifications/**
- 3. apply the complex modification, find the karabiner icon in your menu bar and go to **preferences**
- 4. go to Complex Modifications tab and click the **Add rule** button
- 5. at this point, you should be able to see a custom rule called **"Post Esc if Caps is tapped, Control if held"** with and **Enable** button to the right. Click it.
- 6. it should show now that the rule is enabled. Now, go to parameters tab and change the value of *to_if_alone_timeout_milliseconds* from 1000 to 500 milliseconds.
- 7. **Remap the keys**, at this point, we only changed the behavior of the Control key itself. Now, we need to remap Physical CapsLock key to act as Control and physical Escape key to act as CapsLock ( in case you really need CapsLock functionality ).
    - go to **Simple Modifications** tab and create 2 new simple modifications.
    - Caps_lock -> left_control
    - escape -> caps_lock

- install ctags & add alias to zshrc
[medium guide: navigate es6 projects with vim using ctags](https://medium.com/trabe/navigate-es6-projects-with-vim-using-ctags-948d114b94f3)

```shell
brew install ctags-exuberant
```
- to make ctags work better with javascript use: [romainl/ctags-patterns-for-javascript](https://github.com/romainl/ctags-patterns-for-javascript)
- make sure you don't have and *~/.ctags* file

```shell
git clone https://github.com/romainl/ctags-patterns-for-javascript.git
echo "--options=~/ctags-patterns-for-javascript/ctagsrc" >> ~/.ctags

```

- can't find file or directory error: change to absolute path */Users/blabla/* instead of *~/*

```zshrc
# ctags
alias ctags="`brew --prefix`/bin/ctags"
alias jtags=”ctags -R app config lib && sed -i ‘’ -E ‘/^(if|switch|function|module\.exports|it|describe).+language:js$/d’ tags”
```
- in project root you can now create tags. watch tags and see tag file update
```shell
ctags -R .
make watch
vim -O tags ctagsrc index.js +'set autoread' +'autocmd! CursorHold,CursorHoldI * checktime'
```
