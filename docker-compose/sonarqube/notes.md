sysctl -w vm.max_map_count=262144 && sysctl -w fs.file-max=65536


# on https://hub.docker.com/_/sonarqube

sysctl -w vm.max_map_count=524288
sysctl -w fs.file-max=131072
ulimit -n 131072
ulimit -u 8192

