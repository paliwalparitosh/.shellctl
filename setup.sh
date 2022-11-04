#!/bin/bash

# copy vim rc to HOME
cp -f vimrc ~/.vimrc

# add alias to ~/.bashrc
cat ~/.bashrc | egrep my-bash-setup >/dev/null && v_ret=$? || v_ret=$?

if [ $v_ret -ne 0 ]; then
    echo "#Added by my-bash-setup" >> ~/.bashrc
    echo "source ~/my-bash-setup/bashrc" >> ~/.bashrc
fi

echo "Setup complete. run -> bash"
