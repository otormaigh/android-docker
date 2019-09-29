FROM frolvlad/alpine-java:jdk8-slim

MAINTAINER Elliot Tormey <elliot.tormey@gmail.com>

ENV DOCKER true
ENV ANDROID_HOME /opt/android

# ------------------------------------------------------
# --- Install required tools
# ------------------------------------------------------

RUN apk add --update
RUN apk add --no-cache bash unzip wget git

# ------------------------------------------------------
# --- Download Android SDK tools into $ANDROID_HOME
# ------------------------------------------------------

RUN mkdir -p $ANDROID_HOME
RUN cd $ANDROID_HOME && wget -q https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -O android-sdk.zip
RUN cd $ANDROID_HOME && unzip android-sdk.zip && rm -f android-sdk.zip
ENV PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin

# ------------------------------------------------------
# --- Install Android SDKs and other build packages
# ------------------------------------------------------

# Other tools and resources of Android SDK you should only install the packages you need!
# To get a full list of available options you can use:
#     sdkmanager --list

RUN echo y | sdkmanager "platform-tools"

# Final update just to be sure to be sure
RUN yes | sdkmanager --licenses && sdkmanager --update

# ------------------------------------------------------
# --- Cleanup and rev num
# ------------------------------------------------------

# Cleaning
RUN rm -rf /var/cache/apk/*
