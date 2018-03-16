# Service_Tunnel

Create SSH Tunnel to my GCP VPS for services on DS216J.

## Service

+ `SSH`: 

  + From **192.168.168.106:22**
  + To **ntut.com.tw:9488**

+ `Gitea`:

  + From **192.168.168.106:3000**
  + To **ntut.com.tw:10080**

## Install

1. Clone and `cd` in.
  ```sh
  git clone https://gitea.ntut.com.tw/PinLin/service_tunnel.git ~/service_tunnel
  cd ~/service_tunnel
  ```

2. Edit the content of `service_tunnel.sh`, `tunnel_ssh.conf` and `tunnel_gitea.conf`.
   ```sh
   sed -i "s/{{user}}/$USER/g" service_tunnel.sh
   sed -i "s/{{user}}/$USER/g" tunnel_ssh.conf
   sed -i "s/{{user}}/$USER/g" tunnel_gitea.conf
   ```

3. Copy `service_tunnel.sh` to `/usr/local/etc/rc.d`, `tunnel_ssh.conf` and `tunnel_gitea.conf` to `/etc/init`, then reload.
   ```sh
   sudo cp service_tunnel.sh /usr/local/etc/rc.d/
   sudo cp tunnel_ssh.conf /etc/init/
   sudo cp tunnel_gitea.conf /etc/init/
   sudo initctl reload-configuration
   ```

4. Start!
   ```sh
   sudo initctl start tunnel_ssh
   sudo initctl start tunnel_gitea
   ```
