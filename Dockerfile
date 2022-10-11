FROM centos:7.9.2009


ENV ANDROID_SDK_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_ROOT /opt/android-sdk-linux
ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK /opt/android-sdk-linux
ENV JAVA_HOME /usr/lib/jvm/java-openjdk


# Install required tools
# Dependencies to execute Android builds

RUN yum update -y && yum install -y curl expect java-1.8.0-openjdk java-1.8.0-openjdk-devel unzip bsdtar && yum clean all && rm -rf  /var/cache/*

RUN groupadd android && useradd -d /opt/android-sdk-linux -g android -u 1000 android

COPY tools /opt/tools

COPY licenses /opt/licenses

WORKDIR /opt/android-sdk-linux

RUN /opt/tools/entrypoint.sh built-in &&  rm -rf /opt/android-sdk-linux/emulator

CMD /opt/tools/entrypoint.sh built-in
