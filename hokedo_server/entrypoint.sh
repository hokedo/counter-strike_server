#!/bin/bash

CUSTOM_BASE_FOLDER="/custom"
CUSTOM_FOLDERS=( $CUSTOM_BASE_FOLDER/maps $CUSTOM_BASE_FOLDER/sound $CUSTOM_BASE_FOLDER/overviews )

for folder in "${CUSTOM_FOLDERS[@]}"
do
  if [ -d "$folder" ]; then
     echo "Copying $folder ..."
     cp /$folder/* /hlds/cstrike/`basename $folder`
  fi
done

# Update the AMX Mod X mapmenu
ls /hlds/cstrike/maps | cut -f1 -d. | sort -u > /hlds/cstrike/addons/amxmodx/configs/maps.ini

/hlds/hlds_run -game cstrike -strictportbind -ip 0.0.0.0 -port $PORT +sv_lan $SV_LAN +map $MAP -maxplayers $MAXPLAYERS

exec "$@"
