# Service_Tunnel

Create SSH Tunnel to my GCP VPS for services on DS216J.

## Service

+ `DS216J SSH`: 
  +  **localhost:22**
  +  **ntut.com.tw:9488**

+ `DS216J Gitea`:
  +  **localhost:3000**
  +  **ntut.com.tw:10080**

+ `DS216J Web`:
  +  **localhost:443**
  +  **ntut.com.tw:23333**

+ `DS216J DSM`:
  +  **localhost:5001**
  +  **ntut.com.tw:5002**

+ `3770 RDP`:
  +  **localhost:3389**
  +  **ntut.com.tw:3390**

## Install

1. Clone and `cd` in.
  ```sh
  git clone https://git.ntut.com.tw/PinLin/service_tunnel.git ~/service_tunnel
  cd ~/service_tunnel
  ```

2. Edit the content.
   ```sh
   sed -i "s/{{user}}/$USER/g" service_tunnel.sh
   sed -i "s/{{user}}/$USER/g" tunnel_ds216j_ssh.conf
   sed -i "s/{{user}}/$USER/g" tunnel_ds216j_git.conf
   sed -i "s/{{user}}/$USER/g" tunnel_ds216j_web.conf
   sed -i "s/{{user}}/$USER/g" tunnel_ds216j_dsm.conf
   sed -i "s/{{user}}/$USER/g" tunnel_3770_rdp.conf
   ```

3. Copy.
   ```sh
   sudo cp service_tunnel.sh /usr/local/etc/rc.d/
   sudo cp tunnel_ds216j_ssh.conf /etc/init/
   sudo cp tunnel_ds216j_git.conf /etc/init/
   sudo cp tunnel_ds216j_web.conf /etc/init/
   sudo cp tunnel_ds216j_dsm.conf /etc/init/
   sudo cp tunnel_3770_rdp.conf /etc/init/
   sudo initctl reload-configuration
   ```

4. Start!
   ```sh
   sudo initctl start tunnel_ds216j_ssh
   sudo initctl start tunnel_ds216j_git
   sudo initctl start tunnel_ds216j_web
   sudo initctl start tunnel_ds216j_dsm
   sudo initctl start tunnel_3770_rdp
   ```
