#!/bin/sh
bash -c 'cat <<EOT >>/etc/profile.d/proxy.sh
export http_proxy="http://n2l:N2L123@144.126.132.138:11631"
# For curl
export HTTP_PROXY="http://n2l:N2L123@144.126.132.138:11631"
EOT
'
sudo chmod +x  /etc/profile.d/proxy.sh
source /etc/profile.d/proxy.sh
env | grep -i proxy
docker run -t hvnteam/tuy
