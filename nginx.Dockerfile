FROM nginx:latest

COPY app  /var/www/html
RUN rm -rf /etc/nginx/conf.d/*
COPY nginx/conf.d  /etc/nginx/conf.d
RUN sleep 600

EXPOSE 80
