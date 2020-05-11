FROM nginx:latest
RUN apt -y update && apt -y install openssl && apt -y install certbot


COPY config/nginx/default.conf /tmp/config/nginx_template
# /etc/nginx/certs
# Generate self-signed certificates
WORKDIR /app
COPY scripts/nginx_entrypoint.sh nginx_entrypoint.sh
RUN chmod +x nginx_entrypoint.sh
ENTRYPOINT /bin/bash nginx_entrypoint.sh
