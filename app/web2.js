const fs = require('fs');

const id = 'c5a0fa34-8ec9-4b02-9e01-4e3a9e30e206'; // 替换为实际的 ID
const PORT = 8080; // 替换为实际的端口号

const config = {
  log: {
    loglevel: 'warning'
  },
  inbounds: [
    {
      port: PORT,
      protocol: 'vless',
      settings: {
        clients: [
          {
            id: id,
            flow: 'xtls-rprx-direct'
          }
        ],
        decryption: 'none',
        fallbacks: [
          {
            dest: 3001
          },
          {
            path: '/c5a0fa34-8ec9-4b02-9e01-4e3a9e30e206-trojan',
            dest: 3002
          },
          {
            path: '/c5a0fa34-8ec9-4b02-9e01-4e3a9e30e206-vmess',
            dest: 3003
          }
        ]
      },
      streamSettings: {
        network: 'tcp'
      }
    },
    {
      port: 3001,
      listen: '127.0.0.1',
      protocol: 'vless',
      settings: {
        clients: [
          {
            id: id
          }
        ],
        decryption: 'none'
      },
      streamSettings: {
        network: 'ws',
        security: 'none'
      }
    },
    {
      port: 3002,
      listen: '127.0.0.1',
      protocol: 'trojan',
      settings: {
        clients: [
          {
            password: id
          }
        ]
      },
      streamSettings: {
        network: 'ws',
        security: 'none',
        wsSettings: {
          path: '/c5a0fa34-8ec9-4b02-9e01-4e3a9e30e206-trojan'
        }
      }
    },
    {
      port: 3003,
      listen: '127.0.0.1',
      protocol: 'vmess',
      settings: {
        clients: [
          {
            id: id
          }
        ]
      },
      streamSettings: {
        network: 'ws',
        security: 'none',
        wsSettings: {
          path: '/c5a0fa34-8ec9-4b02-9e01-4e3a9e30e206-vmess'
        }
      }
    }
  ],
  outbounds: [
    {
      protocol: 'freedom'
    }
  ]
};

fs.writeFileSync('config.json', JSON.stringify(config, null, 2));

// 修改文件权限
fs.chmodSync('./web', '755');

// 运行 web
const { execSync } = require('child_process');
execSync('./web -config=config.json');
