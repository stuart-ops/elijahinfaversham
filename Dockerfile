FROM nginx:alpine

# Copy all static website assets
COPY . /usr/share/nginx/html

# Google Cloud Run expects container to listen on $PORT (default 8080)
RUN sed -i 's/80;/8080;/g' /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
