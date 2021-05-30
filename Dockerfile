
FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
MAINTAINER  "vikas"

RUN apt-get update && apt-get install -y --no-install-recommends apache2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mv /var/www/html/index.html index-old.html
ADD webindex.html /var/www/html

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

