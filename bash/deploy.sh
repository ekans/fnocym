#!/bin/bash

ln -s $(readlink -e .bashrc) ~/.bashrc
ln -s $(readlink -e .bash_aliases) ~/.bash_aliases
ln -s $(readlink -e .bash_profile) ~/.bash_profile

