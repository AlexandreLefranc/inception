FROM alpine:3.17.0

RUN apk update
RUN apk add nginx
RUN apk add openssl

RUN openssl req -x509 -nodes -days 365 \
    -subj "/C=FR/ST=FR/O=42/CN=alefranc.42.fr" -addext "subjectAltName=DNS:alefranc.42.fr" \
    -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

COPY ./conf/alefranc.42.fr.conf /etc/nginx/http.d/alefranc.42.fr.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]