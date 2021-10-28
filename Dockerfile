FROM wso2/wso2mi:4.0.0

COPY --chown=wso2carbon:wso2 dropins/wso2-mi-log4j2-kafka-appender-0.1.0.jar /home/wso2carbon/wso2mi-4.0.0/dropins/wso2-mi-log4j2-kafka-appender.jar
COPY --chown=wso2carbon:wso2 entrypoint/docker-entrypoint.sh /home/wso2carbon/docker-entrypoint.sh

USER root

RUN chmod +x /home/wso2carbon/docker-entrypoint.sh && \
    chmod +x /home/wso2carbon/wso2mi-4.0.0/dropins/wso2-mi-log4j2-kafka-appender.jar

USER wso2carbon