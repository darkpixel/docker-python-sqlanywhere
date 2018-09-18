FROM python:3.4-alpine3.8

RUN apk add --no-cache jpeg-dev postgresql-dev postgresql-client pcre-dev py-openssl curl vim tini uwsgi uwsgi-python bash libc6-compat libnsl libnsl-dev
RUN ln -s /usr/lib/libnsl.so /usr/lib/libnsl.so.1

WORKDIR /tmp
RUN curl http://d5d4ifzqzkhwt.cloudfront.net/sqla16client/sqla16_client_linux_x86x64.tar.gz | tar xvzf -
WORKDIR /tmp/client1600/

RUN bash -c "./setup -nogui -ss -I_accept_the_license_agreement -d /opt/sqlanywhere -n Docker -c Docker -install sqlany_client64 -install sqlany_client32"
