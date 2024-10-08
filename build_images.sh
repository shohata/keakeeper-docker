#!/bin/sh

script_path=$(cd "$(dirname "${0}")" && pwd)
cd "${script_path}" || exit

. ./.env

cat > "config/kea/subnets4.json" <<EOF
"subnet4": [
  {
    "id": 1,
    "subnet": "$SUBNET4",
    "pools": [
      {
        "pool": "$POOL4"
      }
    ],
    "interface": "eth0",
    "option-data": [
      {
        "name": "routers",
        "data": "$ROUTER4"
      },
      {
        "name": "domain-name-servers",
        "data": "$DNS4"
      },
    ]
  }
]
EOF

cat > "config/kea/subnets6.json" <<EOF
"subnet6": [
  {
    "id": 1,
    "subnet": "$SUBNET6",
    "pools": [
      {
        "pool": "$POOL6"
      }
    ],
    "interface": "eth0",
    "option-data": [
      {
        "name": "dns-servers",
        "data": "$DNS6"
      }
    ]
  }
]
EOF

docker compose build
