#!/bin/bash

# copy vim rc to HOME
cp -f vimrc ~/.vimrc

# add alias to ~/.bashrc
cat ~/.bashrc | egrep my-bash-setup >/dev/null && v_ret=$? || v_ret=$?

if [ $v_ret -ne 0 ]; then
    echo "" >> ~/.bashrc
    echo "#Added by my-bash-setup" >> ~/.bashrc
    echo "source ~/my-bash-setup/bashrc" >> ~/.bashrc
fi

# add banner to ~/.bashprofile
cat ~/.bash_profile | egrep my-bash-setup >/dev/null && v_ret=$? || v_ret=$?

if [ $v_ret -ne 0 ]; then
    echo "" >> ~/.bash_profile
    echo "#Added by my-bash-setup" >> ~/.bash_profile
    echo "source ~/my-bash-setup/banner" >> ~/.bash_profile
fi

echo "Setup complete. run -> bash"
