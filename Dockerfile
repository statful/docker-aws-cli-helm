FROM alpine

MAINTAINER Vasco Santos <jvosantos@gmail.com>

ARG AWS_VERSION="1.18.21"
ARG HELM_VERSION="v3.1.1"

RUN apk update \
 &&  apk add ca-certificates curl py-pip py2-pip git bash openssl \
 &&  pip install --upgrade pip "awscli==${AWS_VERSION}" \
 &&  curl -LO https://git.io/get_helm.sh \
 &&  chmod 700 get_helm.sh \
 &&  ./get_helm.sh --version ${HELM_VERSION} \
 &&  curl --silent -L https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator -o /usr/local/bin/aws-iam-authenticator \
 &&  chmod +x /usr/local/bin/aws-iam-authenticator \
 &&  rm /var/cache/apk/* \
 &&  rm -rf /tmp/*

