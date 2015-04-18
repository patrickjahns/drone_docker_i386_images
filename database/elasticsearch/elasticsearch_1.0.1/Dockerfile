FROM ubuntu:precise

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && apt-get install -y openjdk-6-jdk wget
RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.1.tar.gz
RUN tar xzf elasticsearch-1.0.1.tar.gz
RUN mv elasticsearch-1.0.1 /opt/elasticsearch
RUN rm elasticsearch-1.0.1.tar.gz

EXPOSE 9200
ENTRYPOINT ["/opt/elasticsearch/bin/elasticsearch"]
CMD ["-Des.index.store.type=memory"]
# Note that there is no -f flag from the commandline