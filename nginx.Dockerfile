FROM nginx:latest

COPY app  /var/www/html
RUN rm -rf /etc/nginx/conf.d/*
COPY nginx/conf.d  /etc/nginx/conf.d

EXPOSE 80
