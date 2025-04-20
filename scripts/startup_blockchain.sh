#!/bin/bash
set -e

# Install dependencies
sudo apt-get update -y
sudo apt-get install -y git curl build-essential jq

# Install Go
GO_VERSION="1.20.4"
curl -OL https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> ~/.bashrc
source ~/.bashrc

# Install Ignite CLI
curl https://get.ignite.com/cli | bash

# Create blockchain project
ignite scaffold chain blockchain

# Initialize the blockchain
cd blockchain
ignite chain build
ignite chain start --home ~/.blockchain --trace
