
 {
    "log": {"loglevel": "warning"},
    "inbounds": [
        {
            "port": 4001,
            "listen": "127.0.0.1",
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "'$id'"
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "path": "/c5a0fa34-8ec9-4b02-9e01-4e3a9e30e206-vless"
                }
            }
        },{
            "port": 4002,
            "listen": "127.0.0.1",
            "protocol": "trojan",
            "settings": {
                "clients": [
                    {
                        "password": "'$id'"
                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "path": "/c5a0fa34-8ec9-4b02-9e01-4e3a9e30e206-trojan"
                }
            }
        },{
            "port": 4003,
            "listen": "127.0.0.1",
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "'$id'"
                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "path": "/c5a0fa34-8ec9-4b02-9e01-4e3a9e30e206-vmess"
                }
            }
        },{
          "port": 4004,
          "protocol": "shadowsocks",
          "settings": {
            "method": "chacha20-ietf-poly1305",
            "password": "'$id'",
            "network": "tcp,udp"
          },
          "streamSettings": {
            "network": "ws",
            "security": "none",
            "wsSettings": {
                "path": "/c5a0fa34-8ec9-4b02-9e01-4e3a9e30e206-shadowsocks"
            }
          }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}' > config.json

chmod +x ./web
./web -config=config.json
