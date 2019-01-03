# Service Tunnel to VPS for DSM
Create SSH Tunnel to my GCP VPS for services on DS216J.

## Service
+ `DS216J SSH`: 
  +  **localhost:22**
  +  **ntut.com.tw:10023**

+ `DS216J Gitea SSH`:
  +  **localhost:9487**
  +  **ntut.com.tw:9488**

+ `DS216J Gitea Web`:
  +  **localhost:3000**
  +  **ntut.com.tw:10080**

+ `DS216J Web`:
  +  **localhost:443**
  +  **ntut.com.tw:10443**

+ `DS216J DSM`:
  +  **localhost:5001**
  +  **ntut.com.tw:5002**

+ `3770 RDP`:
  +  **192.168.168.101:3389**
  +  **ntut.com.tw:3390**

## Install
1. Clone and enter it.
  ```sh
  git clone https://git.ntut.com.tw/PinLin/service_tunnel.git
  cd service_tunnel
  ```

2. Execute `install.sh`.
   ```sh
   sudo ./install.sh
   ```

## Run
1. Start service.
   ```sh
   sudo initctl start tunnel_ds216j_ssh
   sudo initctl start tunnel_ds216j_gitea_ssh
   sudo initctl start tunnel_ds216j_gitea_web
   sudo initctl start tunnel_ds216j_web
   sudo initctl start tunnel_ds216j_dsm
   sudo initctl start tunnel_3770_rdp
   ```

2. Stop service.
   ```sh
   sudo initctl stop tunnel_ds216j_ssh
   sudo initctl stop tunnel_ds216j_gitea_ssh
   sudo initctl stop tunnel_ds216j_gitea_web
   sudo initctl stop tunnel_ds216j_web
   sudo initctl stop tunnel_ds216j_dsm
   sudo initctl stop tunnel_3770_rdp
   ```