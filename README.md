# CheckTcpPort

A program that checks if TCP port is open or closed from a list of hosts and port defined in a YAML file.

## Problem

In some complex organistaions there are multiple environemnts, network, firewall and etc
that are maintained by some manual process. I am doing some discovery to find out about
network connectivity for upstream and downstream for my application and I have a huge list
of systems that I need to connect to. This small program is to help me check for network
access from a list of hosts and produce a small table for a better presentation.

## Requirements

Follow below format:

```bash
dev: # a key identifier that would print as part of table header
  - port: 80
    hosts:
      - www.google.com
      - www.facebook.com
      - localhost
  - port: 443
    hosts:
      - www.google.com
      - www.facebook.com
  - port: 8000
    hosts:
      - 8.8.8.8
      - www.facebook.com
```

## Usage

```bash
$ mix compile && mix help
$ mix start --timeout 3 --file ./hosts/list.yml

+-------------------------------------------------+
|               TCP Check for test                |
+------------------+------+--------+--------------+
| Host             | Port | Status | Reason       |
+------------------+------+--------+--------------+
| 8.8.8.8          | 8000 | closed | timeout      |
| www.facebook.com | 8000 | closed | timeout      |
| www.google.com   | 443  | open   | N/A          |
| www.facebook.com | 443  | open   | N/A          |
| localhost        | 80   | closed | econnrefused |
+------------------+------+--------+--------------+
```
