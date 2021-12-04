# :)

[Thanks Flavio!](https://antelo.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b)

## Getting started

Create a `.homegit` Git folder

    git init --bare $HOME/Documents/.homegit

Create an alias `homegit` you don't need to type it all over again

    alias homegit='/usr/bin/env git --git-dir=$HOME/Documents/.homegit/ --work-tree=$HOME'

Set Git status to hide untracked files

    homegit config --local status.showUntrackedFiles no

Add a `.gitignore` in `$HOME`

    echo '*' > $HOME/.gitignore

Add the alias to `.bashrc` so you can use it later

    echo "alias homegit='/usr/bin/env git --git-dir=$HOME/Documents/.homegit/ --work-tree=$HOME'" >> $HOME/.bashrc

## Usage examples

Status

    homegit status

Add file

    homegit add -f .gitignore README.md .bashrc

Commit

    homegit commit -m "First commit"

Push

    homegit push

## Setup in new environment

Clone repo

    git clone --bare https://github.com/jbourlakos/homegit.git $HOME/Documents/.homegit
Define alias

    alias homegit='/usr/bin/env git --git-dir=$HOME/Documents/.homegit/ --work-tree=$HOME'

Initial checkout

    homegit checkout