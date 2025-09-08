# INSTALL PROMETHEUS IN UBUNTU
REF: https://prometheus.io/download/

## INSTALLING PROMETHEUS
Note: Ensure to keep port 9090 open in the SG of your EC2
```sh
#!/bin/bash

sudo su -
wget https://github.com/prometheus/prometheus/releases/download/v3.0.0-beta.0/prometheus-3.0.0-beta.0.linux-amd64.tar.gz
tar -xvf prometheus-3.0.0-beta.0.linux-amd64.tar.gz
cd prometheus-3.0.0-beta.0.linux-amd64/
nohup ./prometheus --config.file=prometheus.yml > /root/prometheus.log 2>&1 &
```
NOTE: Access Promethus using `EC2_PubicIP:9090`

## INSTALLING NODE EXPORTER
Note: 
* Node Exporter is used to check the CPU & RAM usage in your server
* Run query `node_cpu_seconds_total` to check the CPU usage
* Run query `node_memory_MemAvailable_bytes` to check the available RAM.
* Node exporter uses port `9100`, allow it in the SG of EC2
```sh
#!/bin/bash

sudo su -
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz
tar -xvf node_exporter-1.8.2.linux-amd64.tar.gz
cd node_exporter-1.8.2.linux-amd64
./node_exporter &
```
```sh
cd ../prometheus-3.0.0-beta.0.linux-amd64
```
```sh
vi prometheus.yml
# Check/Add the below under "scrape_configs"
```
```sh
scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']

  - job_name: 'node-exporter'
    static_configs:
      - targets: ['localhost:9100']
```
```sh
ps aux | grep prometheus
```
Check & kill the prometheus process to restart prometheus
```sh
kill <Promethus-PID>
```
```sh
cd ~/prometheus-3.0.0-beta.0.linux-amd64/
nohup ./prometheus --config.file=prometheus.yml > /root/prometheus.log 2>&1 &
```

Access Prometheus
```sh
ip=$(curl -s ifconfig.me)
port=9090

echo "Access Prometheus Server: http://$ip:$port"
```

Queries
`up`                              # shows uptime
`node_cpu_seconds_total`          # shows cpu utilization
`node_memory_MemAvailable_bytes`  # shows available memory
