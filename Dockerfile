## Dockerfile for compilation environment : C/C++ and make
FROM dgricci/alpine:3.8
MAINTAINER Didier Richard <didier.richard@ign.fr>
LABEL   version="1.0.0" \
        alpine="3.8" \
        gosu="1.10" \
        os="Alpine Linux" \
        description="Tools for software development (gcc, g++, make, autotools, etc ...)"

COPY install.sh /usr/local/bin/01-install.sh
COPY uninstall.sh /usr/local/bin/01-uninstall.sh

CMD ["/usr/local/bin/01-install.sh"]

