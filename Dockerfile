FROM ibmcom/swift-ubuntu:latest

LABEL name "swift-in-the-cloud"

RUN mkdir /app
WORKDIR /app
COPY Package.swift /app
COPY Sources /app
COPY public /app
copy .swift-version /app
RUN swift build

EXPOSE 3000

USER root

CMD [".build/debug/app"]
