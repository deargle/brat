#!/bin/bash
WORK_DIR="/shared/work"
DATA_DIR="/shared/data"
THE_DIRS="${WORK_DIR} ${DATA_DIR}"

mkdir -p ${THE_DIRS}
chown -R brat:brat ${THE_DIRS}
chmod -R 770 ${THE_DIRS}
ln -ns ${WORK_DIR} /brat/work && ln -ns ${DATA_DIR} /brat/data
 
exec "$@"