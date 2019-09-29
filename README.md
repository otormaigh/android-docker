Android Docker [![Docker Build Status](https://img.shields.io/docker/build/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/otormaigh/android-docker/) [![DockerPulls](https://img.shields.io/docker/pulls/mashape/kong.svg)](https://hub.docker.com/r/otormaigh/android-docker/)
=============

Docker container that can be used to build Android applications. It purposely has not got many dependencies. packaged with it to save on download size.

If other SDKs are required for your project, update the Dockerfile using [sdkmanager](https://developer.android.com/studio/command-line/sdkmanager.html) to add the necessary dependencies.

Whats in it?
------------
The base image currently being used is [frolvlad/alpine-java:jdk8-slim](https://hub.docker.com/r/frolvlad/alpine-java). It comes with no pre added SDK or build tools. If you are using Googles maven repository in your application, relevant tools will be downloaded as you build. This helps reduce the download size of this image although it does increase initial build times of your Android application.
