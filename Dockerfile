FROM sh3lan93/android-31:latest

RUN apt-get update

RUN apt-get install -y sudo

RUN apt-get install -y build-essential

# REPLACE SHELL WITH BASH
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV NODE_VERSION=18.2.0

RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

ENV NVM_DIR=/root/.nvm

RUN source "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN source "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN source "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}

ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

RUN node --version
RUN npm --version

RUN npm install -g appcenter-cli

RUN apt-get install -y ruby-full

RUN gem install bundler

RUN gem install fastlane

RUN curl -sL https://firebase.tools | bash

RUN apt-get install -y jq

CMD bash