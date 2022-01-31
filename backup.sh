#!/bin/sh

set -e

mkdir /backup
chown git /backup

DUMP_FILENAME="/backup/gitea-dump-$(date +"%Y-%m-%d").zip"

echo "running gitea dump as user git"
su - git -c "/usr/local/bin/gitea dump --file ${DUMP_FILENAME}"

echo "running s3backup"
su - git -c "/usr/local/bin/s3backup ${S3_BUCKET} ${S3_MAP} ${DUMP_FILENAME} ${MAXCOPIES}"

echo "cleaning up"
rm -f ${DUMP_FILENAME}

echo "backup complete"