FROM ubuntu:22.04

ARG USER_ID
ARG GROUP_ID

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
# Set Timezone for tzdata installation
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ 'UTC'

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils \
    && apt-get -y install sudo coreutils \
    openssh-client git git-core bash-completion \
    xxd vim-common wget curl apt-transport-https ca-certificates \
    gnupg2 software-properties-common usbutils iproute2 udev

RUN addgroup --gid $GROUP_ID user \
    && adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user \
    && usermod -a -G sudo user && echo "user ALL=(ALL) NOPASSWD:ALL" >>  /etc/sudoers


USER user