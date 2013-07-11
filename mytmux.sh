#!/bin/sh

mkdir ~/tmux-build ~/tmux
cd ~/tmux-build
wget https://github.com/downloads/libevent/libevent/libevent-1.4.14b-stable.tar.gz
tar zvfx libevent-1.4.14b-stable.tar.gz
cd libevent-1.4.14b-stable
./configure --prefix=$HOME/tmux
make -j2
make install

cd ..
wget http://hivelocity.dl.sourceforge.net/project/tmux/tmux/tmux-1.8/tmux-1.8.tar.gz
tar zvfx tmux-1.8.tar.gz
cd tmux-1.8
./configure --prefix=$HOME/tmux CFLAGS="-I$HOME/tmux/include" LDFLAGS="-L$HOME/tmux/lib"
make -j2
make install

rm -fr ~/tmux-build

export PATH=$PATH:$HOME/bin:$HOME/tmux/bin
