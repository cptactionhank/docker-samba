FROM cptactionhank/ubuntu:trusty
MAINTAINER cptactionhank <cptactionhank@users.noreply.github.com>

RUN apt-get update -qq \
    && apt-get install -yqq samba

EXPOSE 139 445

VOLUME ["/etc/samba", "/var/lib/samba", "/var/log/samba", "/usr/local/samba/private"]

ENTRYPOINT ["smbd", "--foreground", "--log-stdout"]
