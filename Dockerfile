FROM linuxserver/code-server:latest

RUN \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN \
  apt-get update && \
  apt-get install -y \
    snapd \
    yarn

RUN \
  snap install dotnet-sdk --classic && \
  snap alias dotnet-sdk.dotnet dotnet && \
  echo "export MSBuildSDKsPath=/snap/dotnet-sdk/current/sdk/$(dotnet --version)/Sdks" >> ~/.profile

RUN \
  git config --global user.email "xlebenny@gmail.com" && \
  git config --global user.name "Benny Leung"

EXPOSE 8443
