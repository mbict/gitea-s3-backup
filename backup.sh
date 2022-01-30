#! /bin/sh

mkdir /backup
chmod 775 /backup
su git

DUMP_FILENAME=/gitea-dump-$(date +"%Y-%m-%d").zip

echo ${DUMP_FILENAME}
/usr/local/bin/gitea dump --file ${DUMP_FILENAME}
/usr/local/bin/s3backup ${S3_BUCKET} ${S3_MAP} ${DUMP_FILENAME} ${MAXCOPIES}