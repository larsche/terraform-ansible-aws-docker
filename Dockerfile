FROM ubuntu:20.04

ARG TERRAFORM_VERSION="1.1.6"
ENV TERRAFORM_VERSION=${TERRAFORM_VERSION}

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

ENV AWS_ACCESS_KEY_ID=AKIAQHJXAS5LCUKRQ5NC
ENV AWS_SECRET_ACCESS_KEY=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

RUN aws s3api create-bucket --bucket  terraform-user1231234512

## create volume


CMD    ["/bin/bash"]

