# wso2mi-log4j2-kafka-appender

Log4J2 Kafka Appender for WSO2 Micro-Integrator

## Building

Build the appender with:

```shell script
$ mvn clean package
```

## Installing

Copy the `wso2-mi-log4j2-kafka-appender-0.1.0.jar` under `target` directory in `<WSO2_HOME>/dropins` directory.

Configure the `log4j2.properties` as follows:

```
appenders = CARBON_CONSOLE, CARBON_LOGFILE, AUDIT_LOGFILE, ATOMIKOS_LOGFILE, CARBON_TRACE_LOGFILE, osgi, SERVICE_LOGFILE, API_LOGFILE, ERROR_LOGFILE, CORRELATION, KAFKA_APPENDER
#, syslog

appender.KAFKA_APPENDER.type = Kafka
appender.KAFKA_APPENDER.name = KAFKA_APPENDER
appender.KAFKA_APPENDER.layout.type = PatternLayout
appender.KAFKA_APPENDER.layout.pattern = [%d] %5p {%c{1}} - %m%ex%n
appender.KAFKA_APPENDER.property.type = Property
appender.KAFKA_APPENDER.property.name = bootstrap.servers
appender.KAFKA_APPENDER.property.value = redpanda:29092
appender.KAFKA_APPENDER.topic = topic

...

loggers = ..., KAFKA_LOGGER

...

# Custom Kafka Appender
logger.KAFKA_LOGGER.name = KAFKA_LOGGER
logger.KAFKA_LOGGER.level = INFO
logger.KAFKA_LOGGER.additivity = false
logger.KAFKA_LOGGER.appenderRef.KAFKA_APPENDER.ref = KAFKA_APPENDER

...

rootLogger.appenderRef.KAFKA_APPENDER.ref = KAFKA_APPENDER

```

### Running locally

Use `docker-compose.yml` as follows:

```shell script
$ docker compose up
```

Check out the topic:

```shell script
$ kcat -C -b localhost:9092 -t topic
```

Generate new message with:

```shell script
$ curl localhost:8290/health/live -w '\n'
```