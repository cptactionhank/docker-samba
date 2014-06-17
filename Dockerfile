FROM ubuntu:trusty
MAINTAINER cptactionhank <cptactionhank@users.noreply.github.com>

RUN apt-get update -qq \
    && apt-get install -yqq samba libnss-ldap ldap-utils \
    && auth-client-config -t nss -p lac_ldap

EXPOSE 139 445

VOLUME ["/etc/samba", "/var/lib/samba", "/var/log/samba", "/usr/local/samba/private"]

ENTRYPOINY ["smbd", "--foreground", "--log-stdout"]
