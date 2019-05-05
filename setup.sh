#!/bin/bash

while getopts h option
    do
    case "${option}"
    in
    h) echo -e "DB CREDENTIAL: \nUser: postgres \nPassword: basedati2 \nport:5432\n\nPGADMIN4 CREDENTIAL: \nid: base@dati2.it \npassword: basedati2 \nport:5000" && exit 0;;
    esac
done
sudo mkdir -p /tmp/dockerFOLDER
if ! [ -x "$(which docker)" ]; then
  echo 'Error: docker is not installed.' >&2
  exit 1
fi
if ! [ -x "$(which docker-compose)" ]; then
  echo 'docker-compose is not installed.' >&2
  sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi



docker-compose up -d && exit 0



