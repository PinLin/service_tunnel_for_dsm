# Service_Tunnel

Create SSH Tunnel to my GCP VPS for services on DS216J.

## Service

+ `DS216J SSH`: 
  + From **192.168.168.106:22**
  + To **ntut.com.tw:9488**

+ `DS216J Gitea`:
  + From **192.168.168.106:3000**
  + To **ntut.com.tw:10080**

+ `DS216J Web`:
  + From **192.168.168.106:443**
  + To **ntut.com.tw:23333**

+ `DS216J DSM`:
  + From **192.168.168.106:5001**
  + To **ntut.com.tw:5002**

+ `3770 RDP`:
  + From **192.168.168.106:3389**
  + To **ntut.com.tw:3390**

## Install

1. Clone and `cd` in.
  ```sh
  git clone https://git.ntut.com.tw/PinLin/service_tunnel.git ~/service_tunnel
  cd ~/service_tunnel
  ```

2. Edit the content.
   ```sh
   sed -i "s/{{user}}/$USER/g" service_tunnel.sh
   sed -i "s/{{user}}/$USER/g" tunnel_ssh.conf
   sed -i "s/{{user}}/$USER/g" tunnel_git.conf
   sed -i "s/{{user}}/$USER/g" tunnel_web.conf
   sed -i "s/{{user}}/$USER/g" tunnel_dsm.conf
   sed -i "s/{{user}}/$USER/g" tunnel_rdp.conf
   ```

3. Copy.
   ```sh
   sudo cp service_tunnel.sh /usr/local/etc/rc.d/
   sudo cp tunnel_ssh.conf /etc/init/
   sudo cp tunnel_git.conf /etc/init/
   sudo cp tunnel_web.conf /etc/init/
   sudo cp tunnel_dsm.conf /etc/init/
   sudo cp tunnel_rdp.conf /etc/init/
   sudo initctl reload-configuration
   ```

4. Start!
   ```sh
   sudo initctl start tunnel_ssh
   sudo initctl start tunnel_git
   sudo initctl start tunnel_web
   sudo initctl start tunnel_dsm
   sudo initctl start tunnel_rdp
   ```
