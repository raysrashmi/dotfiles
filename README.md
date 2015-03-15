
1. git clone git@github.com:raysrashmi/dotfiles.git
2. Create couple of symbolinks

    ln -s ~/checkouts/dotfiles/zshrc ~/.zshrc

    ln -s ~/checkouts/dotfiles/vimrc ~/.vimrc

    ln -s ~/checkouts/dotfiles/zsh_profile.d ~/.zsh_profile.d

    ln -s ~/checkouts/dotfiles/gvimrc ~/.gvimrc

    ln -s ~/checkouts/dotfiles/gitconfig ~/.gitconfig

    ln -s ~/checkouts/dotfiles/git_ignore ~/.gitignore

    ln -s ~/checkouts/dotfiles/sake ~/bin/sake

3. Switch to zsh type

    chsh

    or

    chsh -s /bin/zsh

You can find your zsh location by by running

  whereis zsh

4. Install macvim

   brew install vim && brew install macvim

   git clone https://github.com/gmarik/Vundle.vim

   run PluginInstall

5. For ctags
    a. brew install ctags
    b. Then in mvim press leader key followed by ct

7. brew install the_silver_searcher
