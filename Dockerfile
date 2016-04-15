FROM vimagick/alpine-arm:3.3
#COPY qemu-arm-static /usr/bin/qemu-arm-static

ENV APP_HOME /home/sandbox-ser2net

RUN apk update && \
    apk add \
    ca-certificates

RUN apk del ca-certificates && rm -rf /var/cache/apk/*

RUN apk update && apk add \
    build-base \ 
    ca-certificates \
    libffi-dev \
    ser2net

ADD ser2net.conf /etc/

WORKDIR /home/sandbox-ser2net

RUN rm -rf /var/cache/apk/*

#ADD . $APP_HOME

ENTRYPOINT ["/usr/sbin/ser2net", "-c", "/etc/ser2net.conf","-n"]
