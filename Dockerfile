FROM bash:4.4

COPY script.sh /

RUN apk add stress-ng 

CMD ["bash", "/script.sh"]

ENTRYPOINT ["/tmp", "-c", "sleep 500"]
