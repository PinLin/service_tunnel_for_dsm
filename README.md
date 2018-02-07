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

1. Clone and `cd` in.
  ```sh
  git clone https://gitea.ntut.com.tw/PinLin/tunnel_gcp.git ~/tunnel_gcp && cd ~/tunnel_gcp
  ```

2. Edit the content of `tunnel_gcp.sh`.
   ```sh
   sed -i "s/{{user}}/$USER/g" tunnel_gcp.sh
   ```

3. Copy `tunnel_gcp.sh` to `/usr/local/etc/rc.d`, `tunnel_ssh.conf` and `tunnel_gitea.conf` to `/etc/init`, then reload.
   ```sh
   sudo cp tunnel_gcp.sh /usr/local/etc/rc.d/
   sudo cp tunnel_ssh.conf /etc/init/
   sudo cp tunnel_gitea.conf /etc/init/
   sudo initctl reload-configuration
   ```

4. Start!
   ```sh
   sudo initctl start tunnel_ssh
   sudo initctl start tunnel_gitea
   ```
