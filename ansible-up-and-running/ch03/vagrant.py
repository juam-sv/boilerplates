#!/usr/bin/env python3
""" Vagrant inventory script """
# Adapted from Mark Mandel's implementation
# https://github.com/markmandel/vagrant_ansible_example

import argparse
import io
import json
import subprocess
import sys

import paramiko


def parse_args():
    """command-line options"""
    parser = argparse.ArgumentParser(description="Vagrant inventory script")
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument('--list', action='store_true')
    group.add_argument('--host')
    return parser.parse_args()


def list_running_hosts():
    """vagrant.py --list function"""
    cmd = ["vagrant", "status", "--machine-readable"]
    status = subprocess.check_output(cmd).rstrip().decode("utf-8")
    hosts = []
    for line in status.splitlines():
        (_, host, key, value) = line.split(',')[:4]
        if key == 'state' and value == 'running':
            hosts.append(host)
    return hosts


def get_host_details(host):
    """vagrant.py --host <hostname> function"""
    cmd = ["vagrant", "ssh-config", host]
    ssh_config = subprocess.check_output(cmd).decode("utf-8")
    config = paramiko.SSHConfig()
    config.parse(io.StringIO(ssh_config))
    host_config = config.lookup(host)
    return {'ansible_host': host_config['hostname'],
            'ansible_port': host_config['port'],
            'ansible_user': host_config['user'],
            'ansible_private_key_file': host_config['identityfile'][0]}


def main():
    """main"""
    args = parse_args()
    if args.list:
        hosts = list_running_hosts()
        json.dump({'vagrant': hosts}, sys.stdout)
    else:
        details = get_host_details(args.host)
        json.dump(details, sys.stdout)


if __name__ == '__main__':
    main()
