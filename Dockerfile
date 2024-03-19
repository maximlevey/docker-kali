FROM kalilinux/kali-rolling:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install Kali Tools
RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install kali-linux-core \
    && apt-get clean

# Install Desktop
RUN apt-get -y install kali-desktop-xfce tightvncserver net-tools

ENV USER=admin
ENV PASSWORD=kali

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]