# linux-setup

Setup (untested):
- ```cd ~```
- ```git clone git@github.com:Michael-Wheeler/bash-aliases.git```
- Add the following lines to the ~/.bashrc:
```
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/bash_aliases/.bash_aliases ]; then
    . ~/bash_aliases/.bash_aliases
fi
```
- Restart bash terminal
- Enter ```alias``` into terminal and check the commands are present
