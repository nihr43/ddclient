from alpine

run echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    apk add ddclient

copy entrypoint.sh /sbin/

cmd ["ash", "/sbin/entrypoint.sh"]
