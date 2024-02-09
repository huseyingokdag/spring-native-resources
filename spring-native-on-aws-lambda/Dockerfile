# Image used to build the native application AWS artifact in a container with an OS compatible with Amazon Linux.

# FROM amazonlinux:2

# RUN yum -y update \
#     && yum install -y zip unzip tar gzip bzip2-devel ed gcc gcc-c++ gcc-gfortran \
#     less libcurl-devel openssl openssl-devel readline-devel xz-devel \
#     zlib-devel glibc-static libcxx libcxx-devel llvm-toolset-7 zlib-static \
#     && rm -rf /var/cache/yum

# # Install SDKMan and Java GraalVM
# RUN curl -s "https://get.sdkman.io" | bash
# RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install java 22.3.1.r17-grl
# ENV JAVA_HOME "/root/.sdkman/candidates/java/current"

# # Install AWS Lambda Builders
# RUN amazon-linux-extras enable python3.8
# RUN yum clean metadata && yum -y install python3.8
# RUN curl -L get-pip.io | python3.8
# RUN pip3 install aws-lambda-builders
FROM amazonlinux:2 AS builder

RUN yum -y update \
    && yum install -y zip unzip tar gzip bzip2-devel ed gcc gcc-c++ gcc-gfortran \
    less libcurl-devel openssl openssl-devel readline-devel xz-devel \
    zlib-devel glibc-static libcxx libcxx-devel llvm-toolset-7 zlib-static \
    && rm -rf /var/cache/yum

# Install SDKMan and Java GraalVM
RUN curl -s "https://get.sdkman.io" | bash
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install java 21.0.2-graal
ENV JAVA_HOME "/root/.sdkman/candidates/java/current"

WORKDIR /build

COPY . /build

RUN ./mvnw --no-transfer-progress native:compile -Pnative
#RUN ./mvnw --no-transfer-progress clean package -Pnative

FROM amazonlinux:2

EXPOSE 8080

# Copy the native executable into the containers
COPY --from=builder /build/target/cloud-function-lambda app
COPY --from=builder /build/target/cloud-function-lambda-native.zip cloud-function-lambda-native.zip
ENTRYPOINT ["/app"]