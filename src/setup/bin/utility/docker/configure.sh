#!/bin/bash

##
# @description An utility to configure Docker
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
# @todo        For now, this utility only works with Debian
##

##
# Implement a basic configuration for Docker
#
# @return void
# @link   https://docs.docker.com/engine/install/linux-postinstall/
##
config_docker() {
    ##
    # @note Add user to `docker` group so it is possible to execute `docker`
    #       without `sudo`
    ##
    sudo usermod -aG docker "$USER"
    newgrp docker
}

##
# Configure rootless mode for Docker
#
# @return void
# @link   https://docs.docker.com/engine/security/rootless/
##
config_docker_rootless_mode() {
    ##
    # @note Install required dependencies
    ##
    sudo apt-get install uidmap
    sudo apt-get install -y dbus-user-session
    sudo apt-get install -y fuse-overlayfs
    sudo apt-get install -y slirp4netns

    ##
    # @note Disable daemon
    ##
    sudo systemctl disable --now docker.service docker.socket

    ##
    # @note Configure daemon as rootless mode
    ##
    dockerd-rootless-setuptool.sh install

    ##
    # @note Enable daemoin in rootless mode
    ##
    systemctl --user start docker

    ##
    # @note Enable daemon so it starts every time the host machine starts
    ##
    systemctl --user enable docker
    sudo loginctl enable-linger "$(whoami)"

    ##
    # @note Configure new docker socket path so client knows how to 
    #       communicate with it
    ##
    echo "export PATH=/usr/bin:$PATH" >> ~/.bashrc
    echo "export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock" >> ~/.bashrc

    ##
    # @note Enable the possibility to map priviliged ports (like `80` or `443`)
    ##
    sudo setcap cap_net_bind_service=ep "$(which rootlesskit)"
    systemctl --user restart docker
}