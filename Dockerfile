FROM alpine:3.7

# Dockerfile Maintainer
MAINTAINER Jan Wagner "waja@cyconet.org"

# Install needed packages
RUN apk add --update --no-cache nginx && rm -rf /var/cache/apk/* && \
    # forward request and error logs to docker log collector
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443
STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
