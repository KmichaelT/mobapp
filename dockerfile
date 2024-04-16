# Use the official Node.js 14 image from Docker Hub
FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:14-buster

# Set up environment variables
ENV ANDROID_HOME /usr/local/android-sdk
ENV PATH ${PATH}:${ANDROID_HOME}/platform-tools

# Download and unzip Android SDK command line tools
RUN mkdir -p ${ANDROID_HOME}/cmdline-tools && \
    wget -q -O sdk.zip https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip && \
    unzip sdk.zip -d ${ANDROID_HOME}/cmdline-tools && \
    mv ${ANDROID_HOME}/cmdline-tools/cmdline-tools ${ANDROID_HOME}/cmdline-tools/latest && \
    rm sdk.zip

# Install Android SDK packages
RUN yes | ${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager --sdk_root=${ANDROID_HOME} "platform-tools" "platforms;android-30"

# Install React Native CLI
RUN npm install -g react-native-cli
