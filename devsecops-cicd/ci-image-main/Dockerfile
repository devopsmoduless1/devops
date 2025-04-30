FROM python:3.11-alpine
RUN apk add --no-cache wget ca-certificates curl git jq openssl bash libc6-compat openssh-client
ENV HELM_VERSION "v3.11.1"
ENV KUBECTL_VERSION "v1.25.0"
ENV YQ_VERSION "v4.8.0"
ENV TERRAFORM_VERSION "1.4.0"
ENV GCLOUD_VERSION="421.0.0"
ENV JSONNET_VERSION="0.17.0"
ENV GCLOUD_URL="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_VERSION}-linux-x86_64.tar.gz"
RUN curl -L ${GCLOUD_URL} | tar xvz && google-cloud-sdk/install.sh -q
ENV PATH="/google-cloud-sdk/bin:${PATH}"
RUN wget https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64.tar.gz -O - |tar xz && mv yq_linux_amd64 /usr/bin/yq
RUN wget https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar xz && mv linux-amd64/helm /usr/local/bin/helm
RUN wget https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl
RUN wget https://github.com/frigus02/kyml/releases/download/v20190906/kyml_20190906_linux_amd64 -O /usr/local/bin/kyml && chmod +x /usr/local/bin/kyml
# Downloading gcloud package
RUN curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-375.0.0-linux-x86_64.tar.gz > /tmp/google-cloud-sdk.tar.gz
# Installing the package
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh
# Adding the package path to local
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin
RUN wget https://github.com/google/jsonnet/releases/download/v${JSONNET_VERSION}/jsonnet-bin-v${JSONNET_VERSION}-linux.tar.gz -O - | tar xz && mv jsonnet /usr/local/bin/jsonnet && chmod +x /usr/local/bin/jsonnet
RUN git clone https://github.com/tfutils/tfenv.git ~/.tfenv && \
    ln -s ~/.tfenv/bin/* /usr/local/bin && \
    tfenv install "0.15.2" && \
    tfenv install ${TERRAFORM_VERSION} && \
    tfenv use ${TERRAFORM_VERSION}
# Install aws cli
RUN apk add --no-cache aws-cli
RUN apk update && apk add python3-dev gcc libc-dev libffi-dev

# Install openstack cli
RUN pip install --upgrade pip && pip install python-openstackclient
RUN update-ca-certificates