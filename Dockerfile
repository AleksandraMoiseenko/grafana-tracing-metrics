FROM openjdk:16
COPY ./target/grafana-tempo-example-1.0.0.jar grafana-tempo-example-1.0.0.jar
COPY ./agent/opentelemetry-javaagent-all.jar opentelemetry-javaagent-all.jar
ENV JAVA_TOOL_OPTIONS=-javaagent:opentelemetry-javaagent-all.jar -Dotel.trace.exporter=otlp -Dotel.exporter.otlp.endpoint=http://tempo-query:55680 -Dotel.resource.attributes=service.name=grafana-tempo-example -Dotel.javaagent.debug=false -Dotel.metrics.exporter=none
ENTRYPOINT ["java", "-jar", "/grafana-tempo-example-1.0.0.jar"]
EXPOSE 8080