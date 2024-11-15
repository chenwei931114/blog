FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y  curl  wget git &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV HUGO_VERSION=0.138.0
RUN wget -O HUGO.deb https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb && \
    dpkg -i HUGO.deb &&\
    rm -r HUGO.deb
COPY . /workspaces/blog
WORKDIR /workspaces/blog

CMD ["/bin/bash"]
