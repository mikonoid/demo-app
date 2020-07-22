##

FROM alpine:latest

MAINTAINER M.Ivanov mikonoid@gmail.com


COPY . .

RUN apk update \
    && apk add nginx git \
    && adduser -D -u 1000 -g 'www' www \
    && mkdir -p /run/nginx \
    && chown -R www:www /var/lib/nginx \
    && chown -R www:www /var/www \
    && rm /etc/nginx/conf.d/default.conf \
    && rm /etc/nginx/nginx.conf \
    && mv /nginx.conf /etc/nginx/nginx.conf \
    && mv /index.html /var/www

RUN chmod +x /start.sh

EXPOSE 8000

CMD ["/start.sh"]
