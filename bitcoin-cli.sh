#!/bin/bash

docker exec -ti bitcoind bitcoin-cli -datadir="/data" "$@"
