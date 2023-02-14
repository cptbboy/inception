FROM alpine:3.16
RUN apk update && apk upgrade && apk add mariadb mariadb-client
COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh
ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["mariadbd-safe"]
