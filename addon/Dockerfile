ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache socat

ADD check_mk_agent.linux /bin/check_mk_agent
RUN chmod a+x /bin/check_mk_agent

RUN mkdir -p /usr/lib/check_mk_agent/local /etc/check_mk /var/lib/check_mk_agent
ADD local.sh /usr/lib/check_mk_agent/local
RUN chmod a+x /usr/lib/check_mk_agent/local/local.sh


# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
