# zsh
My zsh dotfiles directory

## Install
To install:
1. Clone this repository into your `$HOME` directory:
```Sh
git clone https://github.com/chewblacka/zsh.git zsh
```
2. Then run the install script:
```Sh
./zsh/.github/install.sh
```
The install script will
- set `~/.zshenv` to point to the zsh directory
- install the zsh pllugin-manager [antidote](https://getantidote.github.io/)
which then installs the zsh plugins including 
[romkatv's powerlevel10k](https://github.com/romkatv/powerlevel10k) zsh theme.
On first run p10k will go through it's setup script allowing you to customize the look & feel of zsh.
p10k can be reconfigured at any time by running `p10k configure`
