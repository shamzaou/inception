FROM debian:buster

   RUN apt-get update && apt-get install -y nginx openssl

   # Generate self-signed SSL certificate
   RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
       -keyout /etc/ssl/private/nginx-selfsigned.key \
       -out /etc/ssl/certs/nginx-selfsigned.crt \
       -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=localhost"

   COPY conf/nginx.conf /etc/nginx/nginx.conf

   EXPOSE 443

   CMD ["nginx", "-g", "daemon off;"]