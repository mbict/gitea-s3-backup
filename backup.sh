#!/bin/sh

set -e

DUMP_FILENAME="/backup/gitea-dump-$(date +"%Y-%m-%d").zip"

echo "running gitea dump as user git"
/usr/local/bin/gitea dump --file ${DUMP_FILENAME}

echo "running s3backup"
/usr/local/bin/s3backup ${S3_BUCKET} ${S3_MAP} ${DUMP_FILENAME} ${MAXCOPIES}

echo "cleaning up"
rm -f ${DUMP_FILENAME}

echo "backup complete"