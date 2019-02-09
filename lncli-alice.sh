#!/bin/bash

docker exec -ti alice lncli --macaroonpath /root/.lnd/admin.macaroon "$@"
