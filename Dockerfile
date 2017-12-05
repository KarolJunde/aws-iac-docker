FROM alpine:3.2
RUN apk add --update nginx && rm -rf /var/cache/apk/*
RUN mkdir -p /tmp/nginx/client-body

COPY alpine-nginx/nginx/nginx.conf /etc/nginx/nginx.conf
COPY alpine-nginx/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY alpine-nginx/website/index.html /usr/share/nginx/html
COPY alpine-nginx/website/stats.php /usr/share/nginx/stats.php

CMD ["nginx", "-g", "daemon off;"]
