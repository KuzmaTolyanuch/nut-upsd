FROM alpine:edge

# add usb access group
ARG EXTRA_GROUP=dialout

RUN apk add --allow-untrusted --no-cache nut shadow --repository https://dl-cdn.alpinelinux.org/alpine/edge/community 

# rename included config files to .sample, bail out with failure if /etc/nut would not exist
RUN [ -d /etc/nut ] && find /etc/nut/ -type f -exec mv {} {}.sample \; || false

COPY startup.sh /startup.sh

RUN chmod 700 /startup.sh

RUN mkdir -p /var/run/nut && \
    chown nut:nut /var/run/nut && \
    chmod 700 /var/run/nut

RUN usermod -a -G $EXTRA_GROUP nut

ENTRYPOINT ["/startup.sh"]

EXPOSE 3493
