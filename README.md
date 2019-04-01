# Service Tunnel for DS216J
Create SSH tunnel Upstart service to my GCP VPS for services on DS216J.

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

+ `DS216J DSM HTTP`:
  +  **localhost:5000**
  +  **ntut.com.tw:5002**

+ `DS216J DSM HTTPS`:
  +  **localhost:5001**
  +  **ntut.com.tw:5003**

+ `DS216J MariaDB`:
  +  **localhost:3307**
  +  **ntut.com.tw:3307**

+ `3770 SSH`:
  +  **192.168.168.101:22**
  +  **ntut.com.tw:30023**

+ `3770 RDP`:
  +  **192.168.168.101:3389**
  +  **ntut.com.tw:3390**

+ `3770 Code1`:
  +  **192.168.168.101:8701**
  +  **ntut.com.tw:38701**

+ `3770 Code2`:
  +  **192.168.168.101:8702**
  +  **ntut.com.tw:38702**

+ `3770 Code3`:
  +  **192.168.168.101:8703**
  +  **ntut.com.tw:38703**

+ `3770 Code4`:
  +  **192.168.168.101:8704**
  +  **ntut.com.tw:38704**

+ `3770 Code5`:
  +  **192.168.168.101:8705**
  +  **ntut.com.tw:38705**

## Install
1. Clone and enter it.
  ```sh
  git clone https://git.ntut.com.tw/PinLin/service_tunnel.git
  cd service_tunnel
  ```

2. Execute `install.sh`.
   ```sh
   sudo ./install.sh $USER
   ```

## Run
1. Start service.
   ```sh
   sudo initctl start tunnel_ds216j_ssh
   sudo initctl start tunnel_ds216j_gitea_ssh
   sudo initctl start tunnel_ds216j_gitea_web
   sudo initctl start tunnel_ds216j_web
   sudo initctl start tunnel_ds216j_dsm_http
   sudo initctl start tunnel_ds216j_dsm_https
   sudo initctl start tunnel_ds216j_mariadb
   sudo initctl start tunnel_3770_ssh
   sudo initctl start tunnel_3770_rdp
   ```

2. Stop service.
   ```sh
   sudo initctl stop tunnel_ds216j_ssh
   sudo initctl stop tunnel_ds216j_gitea_ssh
   sudo initctl stop tunnel_ds216j_gitea_web
   sudo initctl stop tunnel_ds216j_web
   sudo initctl stop tunnel_ds216j_dsm_http
   sudo initctl stop tunnel_ds216j_dsm_https
   sudo initctl stop tunnel_ds216j_mariadb
   sudo initctl stop tunnel_3770_ssh
   sudo initctl stop tunnel_3770_rdp
   ```