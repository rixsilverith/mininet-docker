FROM ubuntu:22.04

USER root
WORKDIR /root

COPY ENTRYPOINT.sh /

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends \
    curl \
    dnsutils \
    ifupdown \
    iproute2 \
    iptables \
    iputils-ping \
    mininet \
    net-tools \
    openvswitch-switch \
    openvswitch-testcontroller \
    tcpdump \
    vim \
    x11-xserver-utils \
    xterm \
    python3 \
    python3-pip \
 && rm -rf /var/lib/apt/lists/* \
 && touch /etc/network/interfaces \
 && chmod +x /ENTRYPOINT.sh

EXPOSE 6633 6653 6640

ENTRYPOINT ["/ENTRYPOINT.sh"]
