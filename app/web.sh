{
    "log": {
        "loglevel": "warning"
    },
    "inbounds": [
        {
            "port": 3000,
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "bfca87a6-09c0-438c-8135-7b4603047afd",
                        "flow": "xtls-rprx-direct"                       
                    }
                ],
                "decryption": "none",
                "fallbacks": [
                    {
                        "path": "/bfca87a6-09c0-438c-8135-7b4603047afd-vless",
                        "dest": 3001
                    },
                    {
                        "path": "/bfca87a6-09c0-438c-8135-7b4603047afd-trojan",
                        "dest": 3002
                    },
                    {
                        "path": "/bfca87a6-09c0-438c-8135-7b4603047afd-vmess",
                        "dest": 3003
                    }
                ]
            },
            "streamSettings": {
                "network": "tcp"
            }
        },
        {
            "port": 3001,
            "listen": "127.0.0.1",
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "bfca87a6-09c0-438c-8135-7b4603047afd"
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "path": "/bfca87a6-09c0-438c-8135-7b4603047afd-vless"
                }
            }
        },
        {
            "port": 3002,
            "listen": "127.0.0.1",
            "protocol": "trojan",
            "settings": {
                "clients": [
                    {
                        "password": "bfca87a6-09c0-438c-8135-7b4603047afd"
                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "path": "/bfca87a6-09c0-438c-8135-7b4603047afd-trojan"
                }
            }
        },
        {
            "port": 3003,
            "listen": "127.0.0.1",
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "bfca87a6-09c0-438c-8135-7b4603047afd"
                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "path": "/bfca87a6-09c0-438c-8135-7b4603047afd-vmess"
                }
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
