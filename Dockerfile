FROM gitea/gitea:latest

COPY --from=mbict/s3backup /etc/mime.types /etc/mime.types
COPY --from=mbict/s3backup /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=mbict/s3backup /s3backup /usr/local/bin/s3backup

ADD backup.sh /backup.sh

ENTRYPOINT []
CMD ["sh", "/backup.sh"]