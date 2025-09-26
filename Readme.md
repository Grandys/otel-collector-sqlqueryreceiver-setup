# Custom otel collector

Setup for otel collector with components:
* [SQL Query Receiver](https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/receiver/sqlqueryreceiver)
* [PostgreSQL Receiver](https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/receiver/postgresqlreceiver)

## Prerequisites:

* docker
* go (tested with 1.23, 1.24 and 1.25)

[OpenTelemetry Collector Builder (ocb)](https://opentelemetry.io/docs/collector/custom-collector/) will be downloaded as
a part of makefile.

**If your architecture is different than Linux (AMD 64), you need to
change [download link](https://opentelemetry.io/docs/collector/custom-collector/#step-1---install-the-builder) in the
makefile**

## How to use?

1. Build and start with:

```bash
make run
```

2. Open http://localhost:3000
3. Log in with default credentials (admin/admin)
4. Query logs and metrics from database

### Logs

![logs](./images/logs.png)

### Metrics

![metrics](./images/metrics.png)

## What does it do

1. Builds custom otel collector with [provided configuration](./builder-config.yaml)
2. Starts following containers:
    *  postgres with sample data
    * LGTM stack as observability backend
5. Collector periodically (according to the [configuration](otel-collector-config.yaml)) reads data from the database
   and produces otel signals - logs and metrics 
