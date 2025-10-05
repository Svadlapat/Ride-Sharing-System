FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y gnu-smalltalk && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY *.st .

CMD gst ride_sharing.st