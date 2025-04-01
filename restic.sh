#!/bin/bash

source /root/.restic.env
export DIR_NAME=$( dirname -- "$0"; )
export BUCKET="chouette-espace-membre"
export RESTIC_REPOSITORY="s3:s3.rbx.io.cloud.ovh.net/${BUCKET}"

/root/.local/bin/restic backup $DIR_NAME >> /var/log/chouette-restic-${BUCKET}.log
/root/.local/bin/restic forget --keep-daily 14