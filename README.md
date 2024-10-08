# keakeeper-docker

This project deploys [KeaKeeper](https://github.com/designet-inc-oss/KeaKeeper) using Docker.
KeaKeeper is Web Interface which manages Kea DHCP Server.
Kea is globaly used as a DHCP Server.

## Edig Config

Edit `.env` according to your network environment.

## Build

Build configurations and docker images.

```bash
./build_images.sh
```

## Deploy

Deploy services using docker compose.

```bash
docker compose up -d
```
