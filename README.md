Android Docker https://img.shields.io/docker/build/otormaigh/android-docker.svg https://img.shields.io/docker/pulls/otormaigh/android-docker.svg
=============

Docker container that can be used to build Android applications. It purposely has not got many dependencies. packaged with it to save on download size.

If other SDKs are required for your project, update the Dockerfile using [sdkmanager](https://developer.android.com/studio/command-line/sdkmanager.html) to add the necessary dependencies.

Whats in it?
------------

The base image currently being used is Ubuntu 16.04. It comes preinstalled with the following Android SDK and tools.

* Build tools
  * 25.0.2
  * 25.0.3
* SDK
  * android-24
  * android-25
* Google API
  * android-24
* Extras
  * android-m2 repo
  * google-m2 repo
  * Google Play Services
