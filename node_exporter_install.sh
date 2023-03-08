#!/bin/sh

yum install -y wget

cat <<EOF > ~/.wgetrc
use_proxy=on
proxy_user=tomy
proxy_passwd=pa55w0rd
http_proxy=http://myproxy.com:port
https_proxy=http://myproxy.com:port
EOF

cd /opt
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz --no-check-certificate
tar xvfz node_exporter-1.5.0.linux-amd64.tar.gz
rm -f node_exporter-1.5.0.linux-amd64.tar.gz
mv node_exporter-1.5.0.linux-amd64/ node_exporter

cat <<EOS > /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
Documentation=https://github.com/prometheus/node_exporter

[Service]
Type=simple
ExecStart=/opt/node_exporter/node_exporter
Restart=always

[Install]
WantedBy=multi-user.target
EOS

systemctl daemon-reload
systemctl enable node_exporter
systemctl start node_exporter
systemctl status node_exporter