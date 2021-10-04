FROM amazonlinux:latest

WORKDIR /tmp

RUN yum -y install curl tar xz gzip
RUN curl -k https://archive.apache.org/dist/kafka/2.8.1/kafka_2.13-2.8.1.tgz -o kafka.tgz
RUN tar -xf kafka.tgz

FROM amazonlinux:latest
RUN amazon-linux-extras install -y java-openjdk11
WORKDIR /app
COPY --from=0 /tmp/kafka_2.13-2.8.1 ./kafka_2.13-2.8.1
WORKDIR /app/kafka_2.13-2.8.1/bin

ENTRYPOINT [ "/bin/sh", "-c" ]
