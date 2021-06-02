FROM openjdk:8-alpine

ENV ROCKETMQ_VERSION=4.8.0
ENV ROCKETMQ_HOME=/rocketmq
ENV PATH="${ROCKETMQ_HOME}/bin:${PATH}"

RUN wget -qO- https://mirror-hk.koddos.net/apache/rocketmq/${ROCKETMQ_VERSION}/rocketmq-all-${ROCKETMQ_VERSION}-bin-release.zip | busybox unzip -; \
    mv /rocketmq-all-${ROCKETMQ_VERSION}-bin-release $ROCKETMQ_HOME; \
    adduser -h ${ROCKETMQ_HOME} -u 10000 -D rocketmq; \
    chown -R rocketmq:rocketmq ${ROCKETMQ_HOME}; \
    chmod 755 ${ROCKETMQ_HOME}/bin/*

WORKDIR ${ROCKETMQ_HOME}
USER rocketmq