# Custom OtelCollector Example

This repository contains an example of a custom OpenTelemetry Collector (OTel Collector) distribution. The distribution is built using a Go-based OpenTelemetry Collector Builder and then packaged into a Docker image. It is configured to receive OTLP data over HTTP and gRPC, process the data, and then export it to an OTLP HTTP exporter.

## Files

1. `builder-config.yaml`: This file is used to configure the OTel Collector Builder. It specifies the version of the OTel Collector to use, the output path for the build, and the exporters, processors, and receivers to include in the distribution.

2. `otelcol.yaml`: This file is the configuration for the OTel Collector. It specifies the receivers, processors, and exporters that the collector will use. In this case, it is set up to receive OTLP data, process it using a transform processor, and then export it to an OTLP HTTP exporter.

3. `Dockerfile`: This file is used to build a Docker image of the custom OTel Collector distribution. It first builds the OTel Collector using the builder and then copies the built collector and its configuration into a minimal Docker image.

## Usage

### Building the Docker Image

To build the Docker image, use the following command:

```shell
docker build -t otelcol-example:latest .
```

### Running the Docker Image

To run the Docker image, use the following command:

```shell
docker run -p 4317:4317 -p 4318:4318 otelcol-example:latest
```

This will start the OTel Collector, which will listen for OTLP gRPC and HTTP on ports 4317 and 4318 respectively.

## Note

Please ensure that the OTLP HTTP exporter endpoint specified in the `otelcol.yaml` is correct and the backend storage service is running and accessible.

## Disclaimer

This is an example and may not be production-ready. You should thoroughly test any configuration before deploying it in a production environment.