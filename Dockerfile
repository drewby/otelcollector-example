FROM golang:1-bullseye AS build-env

RUN go install go.opentelemetry.io/collector/cmd/builder@latest

WORKDIR /otelcol
COPY builder-config.yaml builder-config.yaml
RUN builder --config builder-config.yaml

FROM golang:1-bullseye
ARG BUILDTIME
ARG VERSION
ARG REVISION

ARG USER_UID=10001
USER ${USER_UID}

ENV BUILDTIME $BUILDTIME
ENV VERSION $VERSION
ENV REVISION $REVISION

COPY --chmod=755 --from=build-env otelcol/otelcol /otelcol
COPY ./otelcol.yaml /etc/otelcol/config.yaml
ENTRYPOINT ["/otelcol"]
CMD ["--config", "/etc/otelcol/config.yaml"]
EXPOSE 4317 55678 55679