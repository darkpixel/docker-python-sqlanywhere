FROM python:3.8.1-buster

#RUN apt-get install -y jpeg-dev postgresql-dev postgresql-client pcre-dev py-openssl curl vim tini bash libc6-compat libnsl libnsl-dev
RUN apt-get update; apt-get install -y libpq-dev curl vim bash libldap2-dev libsasl2-dev

WORKDIR /tmp
RUN curl -L http://d5d4ifzqzkhwt.cloudfront.net/sqla17client/sqla17_client_linux_x86x64.tar.gz | tar xvzf -
WORKDIR /tmp/client1700/

RUN bash -c "./setup -nogui -ss -I_accept_the_license_agreement -d /opt/sqlanywhere -n Docker -c Docker -install sqlany_client32,sqlany_client64"

ENV SQLANY16="/opt/sqlanywhere"
ENV PATH="$PATH:$SQLANY16/bin64:$SQLANY16/bin32:${PATH:-}"
ENV LD_LIBRARY_PATH="$SQLANY16/lib32:$SQLANY16/lib64:${LD_LIBRARY_PATH:-}"
