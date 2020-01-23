#!/bin/sh

CONF_DIRECTORY="{CONF_DIRECTORY}"
DESCRIPTION="{DESCRIPTION}"
USER="{USER}"
ADDRESS="{ADDRESS}"
DESTINATION="{DESTINATION}"
FILENAME="{FILENAME}"

# 服務配置檔的範本
template="description \"Service Tunnel for $DESCRIPTION\"\n
          author \"PinLin/service_tunnel_for_dsm\"\n
          \n
          start on started sshd\n
          stop on stopping sshd\n
          \n
          setuid $USER\n
          \n
          script\n
          \twhile true\n
          \tdo\n
          \t\tssh -o \"ExitOnForwardFailure yes\" -NR $ADDRESS $DESTINATION\n
          \t\tsleep 1s\n
          \tdone\n
          end script\n
          \n
          respawn\n
          respawn limit 1000 1\n"

case $1 in
start)
    # 確認服務配置檔是否還存在
    if ! [ -f $CONF_DIRECTORY/$FILENAME.conf ]; then
        # 不存在就重新產生一個並且啟動它
        echo -e $template >$CONF_DIRECTORY/$FILENAME.conf
        initctl reload-configuration
        initctl start $FILENAME
    fi
    ;;
esac
