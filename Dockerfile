FROM ubuntu:latest

MAINTAINER Vasco Santos <jvosantos@gmail.com>

ARG AWS_VERSION="2.0.6"
ARG HELM_VERSION="v3.2.4"

RUN apt-get update \
  && apt-get install -y ca-certificates curl unzip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_VERSION}.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && ./aws/install \
  && rm -rf aws awscliv2.zip

RUN curl -LO https://git.io/get_helm.sh \
 &&  chmod 700 get_helm.sh \
 &&  ./get_helm.sh --version ${HELM_VERSION} \
 &&  curl --silent -L https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator -o /usr/local/bin/aws-iam-authenticator \
 &&  chmod +x /usr/local/bin/aws-iam-authenticator \
 &&  rm -rf /tmp/*

