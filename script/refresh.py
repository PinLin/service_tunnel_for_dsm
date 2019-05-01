#!/usr/bin/env python3
import os
import sys
import json


def main():
    with open(sys.path[0] + '/../tunnels.json') as f:
        tunnels = json.load(f)

    with open(sys.path[0] + '/../tunnel_template.sh') as f:
        template = f.read()

    for name in tunnels.keys():
        os.system('initctl stop ' + name)

        if (os.path.isfile('/etc/init/' + name + '.conf')):
            os.remove('/etc/init/' + name + '.conf')
        if (os.path.isfile('/usr/local/etc/rc.d/' + name + '.sh')):
            os.remove('/usr/local/etc/rc.d/' + name + '.sh')

    os.system('initctl reload-configuration')

    for name, tunnel in tunnels.items():
        with open('/usr/local/etc/rc.d/' + name + '.sh', 'w') as f:
            f.write(template.format(TUNNEL_NAME=name,
                                    DEVICE=tunnel['DEVICE'],
                                    SERVICE=tunnel['SERVICE'],
                                    LOCAL_USER=tunnel['LOCAL_USER'],
                                    LOCAL_HOST=tunnel['LOCAL_HOST'],
                                    LOCAL_PORT=tunnel['LOCAL_PORT'],
                                    REMOTE_USER=tunnel['REMOTE_USER'],
                                    REMOTE_HOST=tunnel['REMOTE_HOST'],
                                    REMOTE_PORT=tunnel['REMOTE_PORT']))

        os.chmod('/usr/local/etc/rc.d/' + name + '.sh', 0o755)

        os.system('/usr/local/etc/rc.d/' + name + '.sh start')


if __name__ == '__main__':
    main()
