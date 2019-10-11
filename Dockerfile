FROM linuxserver/code-server:latest

RUN \
  apt-get update && \
  apt-get install -y \
    snapd squashfuse fuse \
    yarn

RUN \
  systemctl enable snapd.service && \
  snap install dotnet-sdk --classic && \
  snap alias dotnet-sdk.dotnet dotnet && \
  echo "export MSBuildSDKsPath=/snap/dotnet-sdk/current/sdk/$(dotnet --version)/Sdks" >> ~/.profile

RUN \
  git config --global user.email "xlebenny@gmail.com" && \
  git config --global user.name "Benny Leung"

EXPOSE 8443
