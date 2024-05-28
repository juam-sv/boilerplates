FROM public.ecr.aws/debian/debian:10.13-slim

RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

ENV ETCD_VERSION=v3.5.4
ENV ETCD_DOWNLOAD_URL=https://github.com/etcd-io/etcd/releases/download

RUN wget -q ${ETCD_DOWNLOAD_URL}/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz \
    && tar -xzf etcd-${ETCD_VERSION}-linux-amd64.tar.gz \
    && mv etcd-${ETCD_VERSION}-linux-amd64/etcd* /usr/local/bin/ \
    && rm -rf etcd-${ETCD_VERSION}-linux-amd64.tar.gz etcd-${ETCD_VERSION}-linux-amd64

RUN mkdir -p /etcd-data

ENV ETCD_DATA_DIR="/etcd-data"
ENV ETCD_LISTEN_CLIENT_URLS="http://0.0.0.0:2379"
ENV ETCD_ADVERTISE_CLIENT_URLS="http://0.0.0.0:2379"
ENV ETCD_INITIAL_ADVERTISE_PEER_URLS="http://0.0.0.0:2380"
ENV ETCD_LISTEN_PEER_URLS="http://0.0.0.0:2380"
ENV ETCD_INITIAL_CLUSTER="default=http://0.0.0.0:2380"
ENV ETCD_INITIAL_CLUSTER_TOKEN="etcd-cluster"
ENV ETCD_INITIAL_CLUSTER_STATE="new"
ENV ETCD_NAME="default"

EXPOSE 2379 2380

ENTRYPOINT ["/usr/local/bin/etcd"]
