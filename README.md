## simple_node_exporter_installer

node_exporter can be easily installed in a Linux environment.

## Notes
- Please rewrite the proxy information in `node_exporter_install.sh` by yourself.
- If you use Debian, change "yum" to "apt-get" and execute.

## Getting Started
```bash
git clone https://github.com/szktmyk38f/simple_node_exporter_installer.git
cd simple_node_exporter_installer
chmod 700 node_exporter_install.sh
./node_exporter_install.sh
```

## Access to node_exporter
http://<IP address>:9100