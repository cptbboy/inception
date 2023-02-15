FROM alpine:3.16
RUN apk update && apk upgrade && apk add mariadb mariadb-client > /dev/null
EXPOSE 3306
COPY ./tools/entrypoint.sh /bin/entrypoint
RUN chmod +x /bin/entrypoint
ENTRYPOINT ["entrypoint"]
CMD ["mariadbd-safe"]
