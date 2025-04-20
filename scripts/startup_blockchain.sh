#!/bin/bash
set -e

# Update and install necessary dependencies
sudo apt-get update -y
sudo apt-get install -y curl build-essential git jq

# Install Go (version 1.20.4 for example)
GO_VERSION="1.20.4"
curl -OL https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> ~/.bashrc
source ~/.bashrc

# Install Ignite CLI
curl https://get.ignite.com/cli | bash

# Create blockchain project using Cosmos SDK (Ignite CLI)
ignite scaffold chain blockchain

# Build and start the blockchain node
cd blockchain
ignite chain build
ignite chain start --home ~/.blockchain --trace
