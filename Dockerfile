FROM openjdk:8-jdk-alpine

MAINTAINER Elliot Tormey <elliot.tormey@gmail.com>

ENV DOCKER true
ENV ANDROID_HOME /opt/android

# ------------------------------------------------------
# --- Install required tools
# ------------------------------------------------------

RUN apk add --update
RUN DEBIAN_FRONTEND=noninteractive apk add bash unzip wget git libc6-compat libstdc++ libgcc

# ------------------------------------------------------
# --- Download Android SDK tools into $ANDROID_HOME
# ------------------------------------------------------

RUN mkdir /opt
RUN mkdir $ANDROID_HOME
RUN cd $ANDROID_HOME && wget -q https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip -O android-sdk.zip
RUN cd $ANDROID_HOME && unzip android-sdk.zip && rm -f android-sdk.zip
ENV PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin

# ------------------------------------------------------
# --- Install Android SDKs and other build packages
# ------------------------------------------------------

# Other tools and resources of Android SDK you should only install the packages you need!
# To get a full list of available options you can use:
#     sdkmanager --list

RUN echo y | sdkmanager "platform-tools"

# Build tools
# RUN echo y | sdkmanager "build-tools;26.0.0"

# SDKs
# RUN echo y | sdkmanager "platforms;android-26"

# Extras
# RUN echo y | sdkmanager "extras;android;m2repository"
# RUN echo y | sdkmanager "extras;google;m2repository"
# RUN echo y | sdkmanager "extras;google;google_play_services"

# Final update just to be sure to be sure
RUN echo y | sdkmanager --update

# ------------------------------------------------------
# --- Cleanup and rev num
# ------------------------------------------------------

# Cleaning
RUN rm -rf /var/cache/apk/*
