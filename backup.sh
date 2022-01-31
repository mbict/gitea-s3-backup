#! /bin/sh

mkdir /backup
chmod 775 /backup

DUMP_FILENAME=/backup/gitea-dump-$(date +"%Y-%m-%d").zip

/usr/local/bin/gitea dump --file ${DUMP_FILENAME}
/usr/local/bin/s3backup ${S3_BUCKET} ${S3_MAP} ${DUMP_FILENAME} ${MAXCOPIES}