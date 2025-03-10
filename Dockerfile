FROM alpine:20220328

ARG USER=browser

RUN apk add --no-cache chromium && \
    adduser -D $USER

USER $USER

ENV DISPLAY=host.docker.internal:0.0

CMD chromium-browser --no-sandbox
