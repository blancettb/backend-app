FROM bash:4.4

COPY script.sh /

RUN apk add stress-ng 

CMD ["bash", "printenv > env.text"]

CMD ["bash", "/script.sh"]

