
FROM openjdk:8-jdk-alpine

MAINTAINER Thiago de Castro

WORKDIR /opt

ENV GATLING_VERSION 3.6.0

RUN mkdir -p gatling

RUN apk add zip && \
  apk add --update wget bash libc6-compat && \
  mkdir -p /tmp/downloads && \
  wget -q -O /tmp/downloads/gatling-$GATLING_VERSION.zip \
  https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/$GATLING_VERSION/gatling-charts-highcharts-bundle-$GATLING_VERSION-bundle.zip && \
  mkdir -p /tmp/archive && cd /tmp/archive && \
  unzip /tmp/downloads/gatling-$GATLING_VERSION.zip && \
  mv /tmp/archive/gatling-charts-highcharts-bundle-$GATLING_VERSION/* /opt/gatling/ && \
  rm -rf /tmp/*

WORKDIR  /opt/gatling

VOLUME ["/opt/gatling/results"]

ENV PATH /opt/gatling/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV GATLING_HOME /opt/gatling

COPY gatling/conf /opt/gatling/conf 
COPY gatling/user-files /opt/gatling/user-files

COPY run-gatling.sh run-gatling.sh
RUN chmod +x run-gatling.sh

ENTRYPOINT ["./run-gatling.sh"]