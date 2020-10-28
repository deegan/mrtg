#!/bin/bash

source config
source hosts

# MRTG_ROOT="/var/www/mrtg"
COMMUNITY="public"

# Make configuration file
for HOST in $HOSTS
do
	if [ ! -d $MRTG_ROOT/$HOST ]; then
		echo "Creating directory for host: $HOST";
		mkdir $MRTG_ROOT/$HOST
	fi
	
	if [ ! -f $MRTG_ROOT/cfg/$HOST.cfg ]; then
		echo "Generating cfg for host: $HOST";
		/usr/bin/cfgmaker \
                --global 'WorkDir: '$MRTG_ROOT'/'$HOST \
                --global 'Options[_]: bits,growright' \
                --output $MRTG_ROOT/cfg/$HOST.cfg \
                --ifref=name,descr \
                --ifdesc=nr,descr \
		--zero-speed=1000000000 \
		--snmp-options=:::::1 \
                $COMMUNITY@$HOST
	else
		echo "Skipping $HOST"
	fi
done
