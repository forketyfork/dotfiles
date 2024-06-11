#!/bin/sh
# Install required packages using apt
# Tested on Ubuntu 22.04

sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get dist-upgrade -y && \
    sudo apt-get install vim git
