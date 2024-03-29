FROM linuxserver/code-server:latest

RUN \
  apt-get update && \
  apt-get install -y software-properties-common

RUN \
  add-apt-repository universe && \
  apt-get update && \
  apt-get install -y \
    yarn \
    wget

RUN \
  wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
  dpkg -i packages-microsoft-prod.deb && \
  apt-get install -y apt-transport-https && \
  apt-get update && \
  apt-get install -y dotnet-sdk-3.0 && \
  echo "export MSBuildSDKsPath=/opt/dotnet/sdk/$(dotnet --version)/Sdks" >> ~/.profile

RUN \
  git config --global user.email "xlebenny@gmail.com" && \
  git config --global user.name "Benny Leung"

EXPOSE 8443
