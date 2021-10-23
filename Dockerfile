FROM python:3.9.7-slim-buster

#RUN apt-get install -y jpeg-dev postgresql-dev postgresql-client pcre-dev py-openssl curl vim tini bash libc6-compat libnsl libnsl-dev
RUN apt-get update; apt-get install -y libpq-dev curl vim bash libldap2-dev libsasl2-dev

WORKDIR /tmp
RUN curl -L http://d5d4ifzqzkhwt.cloudfront.net/sqla17client/sqla17_client_linux_x86x64.tar.gz | tar xvzf -
WORKDIR /tmp/client17010/

RUN bash -c "./setup -nogui -ss -I_accept_the_license_agreement -d /opt/sqlanywhere -n Docker -c Docker -install sqlany_client32,sqlany_client64"

ENV SQLANY17="/opt/sqlanywhere"
ENV PATH="$SQLANY17/bin64:$SQLANY17/bin32:${PATH:-}"
ENV NODE_PATH="$SQLANY17/node:${NODE_PATH:-}"
ENV LD_LIBRARY_PATH="$SQLANY17/lib32:${LD_LIBRARY_PATH:-}"
ENV LD_LIBRARY_PATH="$SQLANY17/lib64:${LD_LIBRARY_PATH:-}"
