# ==> Create a container from DEBIAN
FROM debian:bookworm

# ==> MAJ of apt-get, to get the last version of packages
RUN apt-get update && apt-get upgrade -y

# ==> Install NGINX server 
RUN apt install nginx -y

# ==> Install OPENSSL to generate a self-signed certificate
RUN apt-get install openssl -y

# ==> Create the repertory for the certificate and the key
RUN mkdir -p /etc/nginx/ssl

# ==> Generate a self-signed certificate and key
RUN openssl req -newkey rsa:4096 -days 42 -nodes -x509 \
-subj "/C=AE/ST=UAE/L=AbuDhabi/O=42/OU=42/CN=shamzaou.42.fr/UID=shamzaou" \
-out /etc/ssl/certs/inception.crt \
-keyout /etc/ssl/private/inception.key

# ==> Copy the nginx.conf file into the container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# ==> Use chmod to give the right to the user to edit html folder
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# ==> Start the nginx service
CMD [ "nginx", "-g", "daemon off;" ]
