#!/bin/bash
./make-cfg.sh
./update-host-cfg.sh
./start-mrtg.sh
./update-mrtg.sh
./make-index.sh

