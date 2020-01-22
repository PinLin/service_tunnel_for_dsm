#!/usr/bin/env python3
import os
import sys

from config import TUNNELS


CONF_DIRECTORY = os.getenv('CONF_DIRECTORY', '/etc/init')
SH_DIRECTORY = os.getenv('SH_DIRECTORY', '/usr/local/etc/rc.d')


def stop_and_remove_tunnels():
    """
    停止所有的 tunnels 服務
    """
    for filename in os.listdir(CONF_DIRECTORY):
        if not 'service_tunnel' in filename:
            continue

        filename = filename.split('.')[0]

        os.system(f'initctl stop {filename}')

        if os.path.isfile(f'{CONF_DIRECTORY}/{filename}.conf'):
            os.remove(f'{CONF_DIRECTORY}/{filename}.conf')
        if os.path.isfile(f'{SH_DIRECTORY}/{filename}.sh'):
            os.remove(f'{SH_DIRECTORY}/{filename}.sh')

    os.system('initctl reload-configuration')


def create_and_start_tunnels():
    """
    重新建立並啟動 tunnels 服務
    """
    with open(sys.path[0] + '/templates/service_tunnel.sh') as f:
        template = f.read()

    for tunnel in TUNNELS:
        description = tunnel['description']
        user = tunnel['user']
        address = tunnel['address']
        destination = tunnel['destination']
        filename = 'service_tunnel_' + '_'.join(description.lower().split())

        with open(f'{SH_DIRECTORY}/{filename}.sh', 'w') as f:
            f.write(template.format(CONF_DIRECTORY=CONF_DIRECTORY,
                                    DESCRIPTION=description,
                                    USER=user,
                                    ADDRESS=address,
                                    DESTINATION=destination,
                                    FILENAME=filename))

        os.chmod(f'{SH_DIRECTORY}/{filename}.sh', 0o755)
        os.system(f'{SH_DIRECTORY}/{filename}.sh start')


def main():
    stop_and_remove_tunnels()
    create_and_start_tunnels()


if __name__ == '__main__':
    main()
