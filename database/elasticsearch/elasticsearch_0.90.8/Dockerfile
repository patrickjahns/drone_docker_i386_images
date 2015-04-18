FROM ubuntu:precise

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && apt-get install -y openjdk-6-jdk wget
RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.8.tar.gz
RUN tar xzf elasticsearch-0.90.8.tar.gz
RUN mv elasticsearch-0.90.8 /opt/elasticsearch

EXPOSE 9200
ENTRYPOINT ["/opt/elasticsearch/bin/elasticsearch"]
CMD ["-f", "-Des.index.store.type=memory"]
