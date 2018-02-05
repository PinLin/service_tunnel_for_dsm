# Tunnel_GCP

Create SSH Tunnel to my GCP VPS for my DS216J.

Another project is [Tunnel_DS216J](https://gitea.ntut.com.tw/PinLin/tunnel_ds216j)

## Service

+ `SSH`: 

  + From **192.168.168.106:22**
  + To **ntut.com.tw:9488**

+ `Gitea`:

  + From **192.168.168.106:3000**
  + To **ntut.com.tw:10081**

## Install

1. Clone this project.
  ```sh
  git clone ssh://gitea@gitea.ntut.com.tw:9487/PinLin/tunnel_gcp.git
  ```

2. Put `tunnel_gcp` into `/usr/local/etc/rc.d`.
   ```sh
   # Please execute in project directory!!!
   # copy
   sudo cp tunnel_gcp.sh /usr/local/etc/rc.d/
   # link
   sudo ln -s $(pwd)/tunnel_gcp.sh /usr/local/etc/rc.d/tunnel_gcp.sh
   ```

3. Reboot or execute:
   ```sh
   sudo /usr/local/etc/rc.d/tunnel_gcp.sh start
   ```