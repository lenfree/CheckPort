# CheckTcpPort

A program that checks if TCP port is open or closed from a list of hosts and port defined in a YAML file.

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
FILE=hosts/list.yml mix start
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/check_tcp_port](https://hexdocs.pm/check_tcp_port).
