# INSTALL GRAFANA 🛠️
REF: https://grafana.com/docs/grafana/latest/setup-grafana/installation/debian/#install-from-apt-repository

```sh
# !/bin/bash
sudo su -
sudo apt-get install -y apt-transport-https software-properties-common wget
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com beta main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# Updates the list of available packages
sudo apt-get update

 # Installs the latest OSS release:
sudo apt-get install -y grafana

# Installs the latest Enterprise release:
sudo apt-get install -y grafana-enterprise

# Start Grafana
sudo systemctl start grafana-server

# Check Grafana status
sudo systemctl status grafana-server
```

Note: 
* Ensure to keep port 3000 open in the SG of your EC2
* Access your Grafana server using `<EC2_Public_IP>:3000`
* Default username & password is `admin`
* After login --> Add your first data source --> Add Prometheus URL

Integration
* Grafana --> Add data source --> Prometheus
* Connection: `<Prometheus-url>:9090` --> Save & test
* Home --> Create dashboard --> Add visualization --> Data source: Prometheus --> `node_cpu_seconds_total` (Last 5 mins)
* Add query: (To add additional queries)
* Home --> Import dashboard --> 1860 --> Data source: Prometheus
* Ref: `https://grafana.com/grafana/dashboards/`. Import dashboards (1860) or create your own
