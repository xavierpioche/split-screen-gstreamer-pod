FROM ubuntu:22.04

RUN \
    apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y

RUN \
   apt-get install -y nginx

RUN \
    rm -f /.install-deps.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
   
COPY default /etc/nginx/sites-available/default

EXPOSE 80/tcp

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

