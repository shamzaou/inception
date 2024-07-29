FROM debian:bookworm

RUN apt update && apt upgrade -y && \
    apt install -y nginx vim curl openssl && \
    mkdir -p /etc/nginx/ssl \
    mkdir -p /var/run/nginx

RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=AE/ST=UAE/L=AbuDhabi/O=42/OU=42/CN=shamzaou.42.fr/UID=shamzaou"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
