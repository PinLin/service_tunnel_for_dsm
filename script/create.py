#!/usr/bin/env python3
import sys
import json
import refresh


def main():
    tunnel = {
        'DEVICE': input("Please input device name\n> "),
        'SERVICE': input("Please input service name\n> "),
        'LOCAL_USER': input("Please input local username\n> "),
        'LOCAL_HOST': input("Please input local hostname\n> "),
        'LOCAL_PORT': input("Please input local port\n> "),
        'REMOTE_USER': input("Please input remote username\n> "),
        'REMOTE_HOST': input("Please input remote hostname\n> "),
        'REMOTE_PORT': input("Please input remote port\n> "),
    }

    tunnel_name = 'tunnel_{}_{}'.format(
        '_'.join(tunnel['DEVICE'].split()),
        '_'.join(tunnel['SERVICE'].split())).lower()

    with open(sys.path[0] + '/../tunnels.json') as f:
        tunnels = json.load(f)

    if tunnel_name in tunnels:
        print("This tunnel is already exist.", file=sys.stderr)
        return

    tunnels[tunnel_name] = tunnel

    with open(sys.path[0] + '/../tunnels.json', 'w') as f:
        json.dump(tunnels, f, indent=4)

    refresh.main()


if __name__ == '__main__':
    main()
