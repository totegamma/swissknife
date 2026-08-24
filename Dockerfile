
ARG POSTGRES_IMAGE=docker.io/postgres:18-bookworm
ARG AWSCLI_IMAGE=public.ecr.aws/aws-cli/aws-cli:2.22.35

FROM ${AWSCLI_IMAGE} AS awscli

FROM ${POSTGRES_IMAGE}

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      sudo \
      less \
      vim \
      curl \
      wget \
      git \
      zip \
      unzip \
      rsync \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*

COPY --from=awscli /usr/local/aws-cli/ /usr/local/aws-cli/

ENV PATH="/usr/local/aws-cli/v2/current/bin:${PATH}"

WORKDIR /workdir

ENTRYPOINT []
CMD ["bash"]
