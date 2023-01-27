FROM alpine

MAINTAINER Hunter <hunter1981@yandex.ru>

ENV TZ=EUROPE/MOSCOW

RUN apk add nginx
#RUN apk clean all
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/
COPY nginx_default_conf /etc/nginx/http.d/default.conf
#RUN sed -i "0,/nginx/s/nginx/docker-nginx/i" /usr/share/nginx/html/index.html
EXPOSE 8080
CMD [ "nginx" ]
