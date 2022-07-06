# install docker
$ HARBORVERSION=$(curl -s https://github.com/goharbor/harbor/releases/latest/download 2>&1 | grep -Po [0-9]+\.[0-9]+\.[0-9]+)
$ curl -s https://api.github.com/repos/goharbor/harbor/releases/latest | grep browser_download_url | grep online | cut -d '"' -f 4 | wget -qi -
$ tar xvf harbor-online-installer-v$HARBORVERSION.tgz
$ cd harbor
$ wget https://gist.githubusercontent.com/caiodelgadonew/2c41e8d7fc95ddb9e53ab28ae0c6197f/raw/4d3d5fd77db1aac7afacf91fcfa39bf37383afb7/harbor.yml 
$ sudo ./install.sh

#default user/pass
admin/Harbor12345