### Install sdkman

```bash
curl -s "https://get.sdkman.io" | bash
```

### Install GraalVM

```bash
sdk install java 21.0.2-graal
```

```bash
sdk install java 21.0.2-graalce
```

```bash
sdk current java
```

```bash
sdk list java | grep installed
```

```bash
sdk use java 21.0.2-graalce
```

### Generate native image using GraalVM Native Build Tools - Maven Plugin

```bash
mvn -Pnative native:compile
```

### Generate docker image (Spring Boot)

```bash
mvn -Pnative spring-boot:build-image
```

### Package native image using GraalVM Native Build Tools - Maven Plugin

```bash
mvn clean package -Pnative -DskipTests
```

```bash
mvn clean package -Pnative,nativeTest
```

### To check AOT-processed application is starting

```bash
java -Dspring.aot.enabled=true -jar demo-0.0.1-SNAPSHOT.jar
```

### After previous step the native image can be build by command

```bash
native-image --verbose -jar demo-0.0.1-SNAPSHOT.jar
```

###  PGO - Spring Boot Application

```bash
/Users/huseyingokdag/.sdkman/candidates/java/current/bin/native-image --pgo-instrument -cp /Users/huseyingokdag/Downloads/demo/target/classes:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-starter-actuator/3.2.2/spring-boot-starter-actuator-3.2.2.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-starter/3.2.2/spring-boot-starter-3.2.2.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot/3.2.2/spring-boot-3.2.2.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-autoconfigure/3.2.2/spring-boot-autoconfigure-3.2.2.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-starter-logging/3.2.2/spring-boot-starter-logging-3.2.2.jar:/Users/huseyingokdag/.m2/repository/ch/qos/logback/logback-classic/1.4.14/logback-classic-1.4.14.jar:/Users/huseyingokdag/.m2/repository/ch/qos/logback/logback-core/1.4.14/logback-core-1.4.14.jar:/Users/huseyingokdag/.m2/repository/org/apache/logging/log4j/log4j-to-slf4j/2.21.1/log4j-to-slf4j-2.21.1.jar:/Users/huseyingokdag/.m2/repository/org/apache/logging/log4j/log4j-api/2.21.1/log4j-api-2.21.1.jar:/Users/huseyingokdag/.m2/repository/org/slf4j/jul-to-slf4j/2.0.11/jul-to-slf4j-2.0.11.jar:/Users/huseyingokdag/.m2/repository/jakarta/annotation/jakarta.annotation-api/2.1.1/jakarta.annotation-api-2.1.1.jar:/Users/huseyingokdag/.m2/repository/org/yaml/snakeyaml/2.2/snakeyaml-2.2.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-actuator-autoconfigure/3.2.2/spring-boot-actuator-autoconfigure-3.2.2.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-actuator/3.2.2/spring-boot-actuator-3.2.2.jar:/Users/huseyingokdag/.m2/repository/com/fasterxml/jackson/core/jackson-databind/2.15.3/jackson-databind-2.15.3.jar:/Users/huseyingokdag/.m2/repository/com/fasterxml/jackson/core/jackson-annotations/2.15.3/jackson-annotations-2.15.3.jar:/Users/huseyingokdag/.m2/repository/com/fasterxml/jackson/core/jackson-core/2.15.3/jackson-core-2.15.3.jar:/Users/huseyingokdag/.m2/repository/com/fasterxml/jackson/datatype/jackson-datatype-jsr310/2.15.3/jackson-datatype-jsr310-2.15.3.jar:/Users/huseyingokdag/.m2/repository/io/micrometer/micrometer-observation/1.12.2/micrometer-observation-1.12.2.jar:/Users/huseyingokdag/.m2/repository/io/micrometer/micrometer-commons/1.12.2/micrometer-commons-1.12.2.jar:/Users/huseyingokdag/.m2/repository/io/micrometer/micrometer-jakarta9/1.12.2/micrometer-jakarta9-1.12.2.jar:/Users/huseyingokdag/.m2/repository/io/micrometer/micrometer-core/1.12.2/micrometer-core-1.12.2.jar:/Users/huseyingokdag/.m2/repository/org/hdrhistogram/HdrHistogram/2.1.12/HdrHistogram-2.1.12.jar:/Users/huseyingokdag/.m2/repository/org/latencyutils/LatencyUtils/2.0.3/LatencyUtils-2.0.3.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-starter-web/3.2.2/spring-boot-starter-web-3.2.2.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-starter-json/3.2.2/spring-boot-starter-json-3.2.2.jar:/Users/huseyingokdag/.m2/repository/com/fasterxml/jackson/datatype/jackson-datatype-jdk8/2.15.3/jackson-datatype-jdk8-2.15.3.jar:/Users/huseyingokdag/.m2/repository/com/fasterxml/jackson/module/jackson-module-parameter-names/2.15.3/jackson-module-parameter-names-2.15.3.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-starter-tomcat/3.2.2/spring-boot-starter-tomcat-3.2.2.jar:/Users/huseyingokdag/.m2/repository/org/apache/tomcat/embed/tomcat-embed-core/10.1.18/tomcat-embed-core-10.1.18.jar:/Users/huseyingokdag/.m2/repository/org/apache/tomcat/embed/tomcat-embed-el/10.1.18/tomcat-embed-el-10.1.18.jar:/Users/huseyingokdag/.m2/repository/org/apache/tomcat/embed/tomcat-embed-websocket/10.1.18/tomcat-embed-websocket-10.1.18.jar:/Users/huseyingokdag/.m2/repository/org/springframework/spring-web/6.1.3/spring-web-6.1.3.jar:/Users/huseyingokdag/.m2/repository/org/springframework/spring-beans/6.1.3/spring-beans-6.1.3.jar:/Users/huseyingokdag/.m2/repository/org/springframework/spring-webmvc/6.1.3/spring-webmvc-6.1.3.jar:/Users/huseyingokdag/.m2/repository/org/springframework/spring-aop/6.1.3/spring-aop-6.1.3.jar:/Users/huseyingokdag/.m2/repository/org/springframework/spring-context/6.1.3/spring-context-6.1.3.jar:/Users/huseyingokdag/.m2/repository/org/springframework/spring-expression/6.1.3/spring-expression-6.1.3.jar:/Users/huseyingokdag/.m2/repository/org/slf4j/slf4j-api/2.0.11/slf4j-api-2.0.11.jar:/Users/huseyingokdag/.m2/repository/org/springframework/spring-core/6.1.3/spring-core-6.1.3.jar:/Users/huseyingokdag/.m2/repository/org/springframework/spring-jcl/6.1.3/spring-jcl-6.1.3.jar --no-fallback -o /Users/huseyingokdag/Downloads/demo/target/demo -H:ConfigurationFileDirectories=/Users/huseyingokdag/Downloads/demo/target/graalvm-reachability-metadata/c46436129e4779a9cdc9f4b7834596fe47abbccc/org.hdrhistogram/HdrHistogram/2.1.12,/Users/huseyingokdag/Downloads/demo/target/graalvm-reachability-metadata/c46436129e4779a9cdc9f4b7834596fe47abbccc/org.apache.tomcat.embed/tomcat-embed-core/10.0.20,/Users/huseyingokdag/Downloads/demo/target/graalvm-reachability-metadata/c46436129e4779a9cdc9f4b7834596fe47abbccc/com.fasterxml.jackson.core/jackson-databind/2.15.2,/Users/huseyingokdag/Downloads/demo/target/graalvm-reachability-metadata/c46436129e4779a9cdc9f4b7834596fe47abbccc/ch.qos.logback/logback-classic/1.4.1
```

```bash
/Users/huseyingokdag/.sdkman/candidates/java/current/bin/native-image --pgo=/Users/huseyingokdag/Downloads/demo/default.iprof -cp /Users/huseyingokdag/Downloads/demo/target/classes:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-starter-actuator/3.2.2/spring-boot-starter-actuator-3.2.2.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-starter/3.2.2/spring-boot-starter-3.2.2.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot/3.2.2/spring-boot-3.2.2.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-autoconfigure/3.2.2/spring-boot-autoconfigure-3.2.2.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-starter-logging/3.2.2/spring-boot-starter-logging-3.2.2.jar:/Users/huseyingokdag/.m2/repository/ch/qos/logback/logback-classic/1.4.14/logback-classic-1.4.14.jar:/Users/huseyingokdag/.m2/repository/ch/qos/logback/logback-core/1.4.14/logback-core-1.4.14.jar:/Users/huseyingokdag/.m2/repository/org/apache/logging/log4j/log4j-to-slf4j/2.21.1/log4j-to-slf4j-2.21.1.jar:/Users/huseyingokdag/.m2/repository/org/apache/logging/log4j/log4j-api/2.21.1/log4j-api-2.21.1.jar:/Users/huseyingokdag/.m2/repository/org/slf4j/jul-to-slf4j/2.0.11/jul-to-slf4j-2.0.11.jar:/Users/huseyingokdag/.m2/repository/jakarta/annotation/jakarta.annotation-api/2.1.1/jakarta.annotation-api-2.1.1.jar:/Users/huseyingokdag/.m2/repository/org/yaml/snakeyaml/2.2/snakeyaml-2.2.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-actuator-autoconfigure/3.2.2/spring-boot-actuator-autoconfigure-3.2.2.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-actuator/3.2.2/spring-boot-actuator-3.2.2.jar:/Users/huseyingokdag/.m2/repository/com/fasterxml/jackson/core/jackson-databind/2.15.3/jackson-databind-2.15.3.jar:/Users/huseyingokdag/.m2/repository/com/fasterxml/jackson/core/jackson-annotations/2.15.3/jackson-annotations-2.15.3.jar:/Users/huseyingokdag/.m2/repository/com/fasterxml/jackson/core/jackson-core/2.15.3/jackson-core-2.15.3.jar:/Users/huseyingokdag/.m2/repository/com/fasterxml/jackson/datatype/jackson-datatype-jsr310/2.15.3/jackson-datatype-jsr310-2.15.3.jar:/Users/huseyingokdag/.m2/repository/io/micrometer/micrometer-observation/1.12.2/micrometer-observation-1.12.2.jar:/Users/huseyingokdag/.m2/repository/io/micrometer/micrometer-commons/1.12.2/micrometer-commons-1.12.2.jar:/Users/huseyingokdag/.m2/repository/io/micrometer/micrometer-jakarta9/1.12.2/micrometer-jakarta9-1.12.2.jar:/Users/huseyingokdag/.m2/repository/io/micrometer/micrometer-core/1.12.2/micrometer-core-1.12.2.jar:/Users/huseyingokdag/.m2/repository/org/hdrhistogram/HdrHistogram/2.1.12/HdrHistogram-2.1.12.jar:/Users/huseyingokdag/.m2/repository/org/latencyutils/LatencyUtils/2.0.3/LatencyUtils-2.0.3.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-starter-web/3.2.2/spring-boot-starter-web-3.2.2.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-starter-json/3.2.2/spring-boot-starter-json-3.2.2.jar:/Users/huseyingokdag/.m2/repository/com/fasterxml/jackson/datatype/jackson-datatype-jdk8/2.15.3/jackson-datatype-jdk8-2.15.3.jar:/Users/huseyingokdag/.m2/repository/com/fasterxml/jackson/module/jackson-module-parameter-names/2.15.3/jackson-module-parameter-names-2.15.3.jar:/Users/huseyingokdag/.m2/repository/org/springframework/boot/spring-boot-starter-tomcat/3.2.2/spring-boot-starter-tomcat-3.2.2.jar:/Users/huseyingokdag/.m2/repository/org/apache/tomcat/embed/tomcat-embed-core/10.1.18/tomcat-embed-core-10.1.18.jar:/Users/huseyingokdag/.m2/repository/org/apache/tomcat/embed/tomcat-embed-el/10.1.18/tomcat-embed-el-10.1.18.jar:/Users/huseyingokdag/.m2/repository/org/apache/tomcat/embed/tomcat-embed-websocket/10.1.18/tomcat-embed-websocket-10.1.18.jar:/Users/huseyingokdag/.m2/repository/org/springframework/spring-web/6.1.3/spring-web-6.1.3.jar:/Users/huseyingokdag/.m2/repository/org/springframework/spring-beans/6.1.3/spring-beans-6.1.3.jar:/Users/huseyingokdag/.m2/repository/org/springframework/spring-webmvc/6.1.3/spring-webmvc-6.1.3.jar:/Users/huseyingokdag/.m2/repository/org/springframework/spring-aop/6.1.3/spring-aop-6.1.3.jar:/Users/huseyingokdag/.m2/repository/org/springframework/spring-context/6.1.3/spring-context-6.1.3.jar:/Users/huseyingokdag/.m2/repository/org/springframework/spring-expression/6.1.3/spring-expression-6.1.3.jar:/Users/huseyingokdag/.m2/repository/org/slf4j/slf4j-api/2.0.11/slf4j-api-2.0.11.jar:/Users/huseyingokdag/.m2/repository/org/springframework/spring-core/6.1.3/spring-core-6.1.3.jar:/Users/huseyingokdag/.m2/repository/org/springframework/spring-jcl/6.1.3/spring-jcl-6.1.3.jar --no-fallback -o /Users/huseyingokdag/Downloads/demo/target/demo -H:ConfigurationFileDirectories=/Users/huseyingokdag/Downloads/demo/target/graalvm-reachability-metadata/c46436129e4779a9cdc9f4b7834596fe47abbccc/org.hdrhistogram/HdrHistogram/2.1.12,/Users/huseyingokdag/Downloads/demo/target/graalvm-reachability-metadata/c46436129e4779a9cdc9f4b7834596fe47abbccc/org.apache.tomcat.embed/tomcat-embed-core/10.0.20,/Users/huseyingokdag/Downloads/demo/target/graalvm-reachability-metadata/c46436129e4779a9cdc9f4b7834596fe47abbccc/com.fasterxml.jackson.core/jackson-databind/2.15.2,/Users/huseyingokdag/Downloads/demo/target/graalvm-reachability-metadata/c46436129e4779a9cdc9f4b7834596fe47abbccc/ch.qos.logback/logback-classic/1.4.1
```

---

```bash
ps x -o pid,rss,command -p 61172
```