FROM linuxserver/code-server:latest

RUN \
  snap install dotnet-sdk --classic && \
  snap alias dotnet-sdk.dotnet dotnet && \
  echo "export MSBuildSDKsPath=/snap/dotnet-sdk/current/sdk/$(dotnet --version)/Sdks" >> ~/.profile

RUN \
  apt-get -y install yarn

RUN \
  git config --global user.email "xlebenny@gmail.com" && \
  git config --global user.name "Benny Leung"

EXPOSE 8443
