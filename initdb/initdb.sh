#!/bin/bash

echo "$0: initializing database"
find /docker-entrypoint-initdb.d -mindepth 2 -type f | sort | while read f; do
  case "$f" in
    *.sql)    echo "$0: running $f"; "${mysql[@]}" < "$f";;
    *.sql.gz) echo "$0: running $f"; gunzip -c "$f" | "${mysql[@]}";;
    *)        echo "$0: ignoring $f" ;;
  esac
done
echo "$0: initialized"
echo
