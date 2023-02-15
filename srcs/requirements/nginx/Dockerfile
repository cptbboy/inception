FROM alpine:3.16
RUN apk update && apk upgrade && apk add nginx openssl > /dev/null
COPY ./conf/inception.conf /etc/nginx/http.d/default.conf
RUN sed -i 's/error_log \/var\/log\/nginx\/error.log warn/error_log \/var\/www\/html\/nginx_error.log info/g' /etc/nginx/nginx.conf
RUN sed -i 's/ssl_protocols TLSv1.1 TLSv1.2 TLSv1.3/ssl_protocols TLSv1.2 TLSv1.3/g' /etc/nginx/nginx.conf
RUN openssl req -x509 -days 365 -new -newkey rsa:2048 -nodes -out /etc/ssl/certs/rsiebert_42_fr.crt -keyout /etc/ssl/private/rsiebert_42_fr.key -subj "/C=DE/ST=BW/L=Heilbronn/O=Roman Siebert/CN=rsiebert.42.fr"
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
