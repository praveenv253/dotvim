dotvim
======

My .vim folder.

Set up as follows:

1. Clone this repository and set it up as your .vim folder
    ```
    cd
    git clone https://github.com/praveenv253/dotvim.git .vim
    ```

2. Create a symbolic link for .vimrc
    ```
    ln -s .vim/vimrc .vimrc
    ```

3. Copy the file for powerline fonts
    ```
    mkdir -p .fonts
    cd .fonts
    ln -s ~/.vim/DejaVuSansMono-Powerline.ttf
    ```

4. Clone the bundle repository
    ```
    cd ~/.vim
    git clone https://github.com/praveenv253/vim-bundle bundle
    ```

5. Set up the bundle submodules
    ```
    cd ~/.vim/bundle
    git submodule init
    git submodule update
    ```

That's it!

