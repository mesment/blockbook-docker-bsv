#!/bin/bash

# Blockbook must be run from this directory
cd /opt/coins/blockbook/bcashsv

# Start blockbook
/opt/coins/blockbook/bcashsv/bin/blockbook -blockchaincfg=/opt/coins/blockbook/bcashsv/config/blockchaincfg.json \
-datadir=/opt/coins/data/bcashsv/blockbook/db -sync -internal=:9046 -public=:9146 \
-certfile=/opt/coins/blockbook/bcashsv/cert/blockbook -explorer= -log_dir=/opt/coins/blockbook/bcashsv/logs -workers=1
