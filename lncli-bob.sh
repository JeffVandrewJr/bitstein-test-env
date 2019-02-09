#!/bin/bash

docker exec -ti bob lncli --macaroonpath /root/.lnd/admin.macaroon "$@"
