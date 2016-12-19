FROM debian:jessie

ENV ANDROID_HOME /opt/android

# ------------------------------------------------------
# --- Install required tools

RUN apt-get update

# Dependencies to execute Android builds
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gradle unzip git curl wget openjdk-8-jdk libc6:i386 libstdc++6:i386 libgcc1:i386 libncurses5:i386 libz1:i386

# ------------------------------------------------------
# --- Download Android SDK tools into $ANDROID_HOME

RUN mkdir /opt/android
RUN cd /opt/android && wget -q https://dl.google.com/android/repository/tools_r25.2.3-linux.zip -O android-sdk.zip
RUN cd /opt/android && unzip android-sdk.zip && rm -f android-sdk.zip

ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin

# ------------------------------------------------------
# --- Install Android SDKs and other build packages

# Other tools and resources of Android SDK you should only install the packages you need!
# To get a full list of available options you can use:
#     sdkmanager --list
RUN echo y | sdkmanager "platform-tools"

# build tools
# Please keep these in descending order!
RUN echo y | sdkmanager "build-tools;25.0.2"
RUN echo y | sdkmanager "build-tools;25.0.1"
RUN echo y | sdkmanager "build-tools;25.0.0"

# SDKs
# Please keep these in descending order!
RUN echo y | sdkmanager "platforms;android-25"
RUN echo y | sdkmanager "platforms;android-24"

# Extras
RUN echo y | sdkmanager "extras;android;m2repository"
RUN echo y | sdkmanager "extras;google;m2repository"
RUN echo y | sdkmanager "extras;google;google_play_services"

# google apis
# Please keep these in descending order!
RUN echo y | sdkmanager "add-ons;addon-google_apis-google-24"

RUN echo y | sdkmanager --update

# ------------------------------------------------------
# --- Cleanup and rev num

# Cleaning
RUN apt-get clean
