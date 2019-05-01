#!/usr/bin/env python3
import os
import sys
import json
import refresh


def main():
    device = input("Please input device name\n> ")
    service = input("Please input service name\n> ")

    tunnel_name = 'tunnel_{}_{}'.format(
        '_'.join(device.split()),
        '_'.join(service.split())).lower()

    with open(sys.path[0] + '/../tunnels.json') as f:
        tunnels = json.load(f)

    if not tunnel_name in tunnels:
        print("This tunnel is not exist.", file=sys.stderr)
        return

    del tunnels[tunnel_name]

    os.system('initctl stop ' + tunnel_name)

    if (os.path.isfile('/etc/init/' + tunnel_name + '.conf')):
        os.remove('/etc/init/' + tunnel_name + '.conf')
    if (os.path.isfile('/usr/local/etc/rc.d/' + tunnel_name + '.sh')):
        os.remove('/usr/local/etc/rc.d/' + tunnel_name + '.sh')

    with open(sys.path[0] + '/../tunnels.json', 'w') as f:
        json.dump(tunnels, f, indent=4)

    refresh.main()


if __name__ == '__main__':
    main()
