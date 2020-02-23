# conceal-guardian-docker
This is a docker container that run conceal-core and conceal-guardian

Clone with : `git clone --recursive https://github.com/AxVultis/conceal-guardian-docker`

A config file example for the guardian is `config.json.example`

Important : after `git clone` you **must** edit the config file under `conceal-guardian/config.json` :
- `cd conceal-guardian-docker/conceal-guardian`
- `cp ../config.json.example config.json`
- edit the node name and fee address (do not touch path)
- then go back to the "root" where you clone this repo `cd ..`
- build the container with `docker-compose up -d`

After few minutes (build time) the container will be up and running on port 16000

The `.conceal` folder where all the blocs are is located on the host machine on `.conceal` (/!\ it will be heavy ~2GB)
