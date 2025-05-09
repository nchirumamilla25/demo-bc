#!/bin/bash
set -e

# Update and install necessary dependencies
sudo apt-get update -y
sudo apt-get install -y curl software-properties-common

# Install Prometheus
PROM_VERSION="2.45.0"
wget https://github.com/prometheus/prometheus/releases/download/v$PROM_VERSION/prometheus-$PROM_VERSION.linux-amd64.tar.gz
tar xvf prometheus-$PROM_VERSION.linux-amd64.tar.gz
sudo mv prometheus-$PROM_VERSION.linux-amd64 /usr/local/prometheus

# Create Prometheus configuration
cat <<EOF | sudo tee /usr/local/prometheus/prometheus.yml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'blockchain-node'
    static_configs:
      - targets: ['VM1_IP_ADDRESS:26660']
EOF

# Install Grafana
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt-get update -y
sudo apt-get install grafana -y

# Start Prometheus and Grafana
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

# Start Prometheus
sudo /usr/local/prometheus/prometheus --config.file=/usr/local/prometheus/prometheus.yml &
