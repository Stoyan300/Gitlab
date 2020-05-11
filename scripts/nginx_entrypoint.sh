 sleep 60
 certbot certonly \
  --standalone \
  --non-interactive \
  --agree-tos \
  --email $EMAIL \
  --domains $HOST
sleep 60
envsubst '\$$HOST' < /tmp/config/nginx_template > /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'
