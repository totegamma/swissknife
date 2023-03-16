FROM ubuntu

RUN apt-get update \
 && apt-get install -y \
      sudo less vim curl \
      zip unzip \
      postgresql-client
  
# aws cli v2 のインストール
# https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/install-cliv2-linux.html
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install

WORKDIR /workdir

cmd bash
