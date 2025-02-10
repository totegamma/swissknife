FROM ubuntu

RUN apt update \
 && apt install -y \
      sudo lsb-release less vim curl wget git \
      zip unzip rsync

RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
 && wget -qO- https://www.postgresql.org/media/keys/ACCC4CF8.asc > /etc/apt/trusted.gpg.d/pgdg.asc \
 && apt update \
 && apt install -y postgresql-client
  
# aws cli v2 のインストール
# https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/install-cliv2-linux.html
RUN sh -c 'curl "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o "awscliv2.zip"'
RUN unzip awscliv2.zip
RUN sudo ./aws/install

WORKDIR /workdir

cmd bash
