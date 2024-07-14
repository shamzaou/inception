FROM debian:bookworm

RUN apt update && apt upgrade -y && \
    apt install -y nginx vim curl openssl && \
    mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=shamzaou"
