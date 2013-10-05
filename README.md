# Dotty repository

Dotty will symlink files and directories in the root your repos dotfiles/ directory, relative to ~.
You can symlink stuff to sub directories of ~ by using the in+subdir directory naming convention.

#### Examples

    dotfiles/.vim             => ~/.vim
    dotfiles/in+.ssh/config   => ~/.ssh/config
    dotfiles/in+a/in+b/c      => ~/a/b/c

## Setup

    $ gem install dotty
    $ dotty add dev git@github.com:MattesGroeger/dotfiles.git

## Update

    $ dotty update dev
    $ dotty bootstrap dev
