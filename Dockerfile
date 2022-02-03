FROM ubuntu:20.04

ARG TERRAFORM_VERSION="0.12.29"
ENV TERRAFORM_VERSION=${TERRAFORM_VERSION}
ENV AWS_ACCESS_KEY_ID=AKIATCOQ5JMXVZGN4A43
ENV AWS_SECRET_ACCESS_KEY=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

RUN apt-get update \
    && apt-get install -y wget curl python3 python3-pip python3-boto unzip  vim less \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip '*.zip' -d /usr/local/bin \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install -i /usr/local/aws-cli -b /usr/local/bin \
    && python3 -m pip install ansible \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN aws s3api create-bucket --bucket  terraform-user1231234512

## create volume


CMD    ["/bin/bash"]

