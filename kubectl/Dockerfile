FROM alpine:3.14
LABEL maintainer="LuoHui <mylhmail@163.com>" version="1.0" license="MIT"

ENV KUBECTL_VERSION="v1.23.3"
ENV RELEASE_URL="https://storage.googleapis.com/kubernetes-release"

RUN set -ex \
    && wget ${RELEASE_URL}/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && wget ${RELEASE_URL}/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl.sha256 \
    && echo "$(cat kubectl.sha256)  kubectl" | sha256sum -c - \
    && install -m 0755 kubectl /usr/local/bin/ \
    && kubectl version --client \
    && rm -f kubectl kubectl.sha256

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
