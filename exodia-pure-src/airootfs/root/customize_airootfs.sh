#!/usr/bin/env bash

set -e -u

# Enable Parallel Downloads
sed -i -e 's|#ParallelDownloads.*|ParallelDownloads = 6|g' /etc/pacman.conf
sed -i -e '/#\[testing\]/Q' /etc/pacman.conf

# Enable Chaotic AUR
pacman-key --init
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA220DFC880C036

#--------------------------------------------------------------

# Set zsh as default shell for new user
sed -i -e 's#SHELL=.*#SHELL=/bin/zsh#g' /etc/default/useradd

#--------------------------------------------------------------
