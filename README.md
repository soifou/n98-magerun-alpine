# n98-magerun on Alpine

Latest build of n98-magerun 1.x utility intended to work with Magento 1.x framework. This build run under an Alpine Linux edge (~55Mb).

## How to use it
Create a bash function, ie:
```
function n98() {
    DOCKER_NETWORK_NAME="docker_default"
    MAGENTO_DIR=$(pwd)
    docker run -it --rm \
        -v $MAGENTO_DIR:/mnt \
        -u `id -u`:`id -g` \
        --net=$DOCKER_NETWORK_NAME \
        soifou/n98-magerun-alpine ${@:1}
}
```
**NOTE**: We mount here the volume of the current host directory (`-v` argument) and fill the current docker network (`--net` argument) where your current running containers are in (database, php, ...).

Reload your shell, then go to your Magento directory and start using it with:
```
$ n98
```

Because you mount a volume from the current directory, if you want to use the database import command, the dump should be move also in the current directory and you have to fill the path from the docker working directory, for example:
```
$ n98 db:import --compression='gzip' /mnt/dump.sql.gz
```