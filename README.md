# n98-magerun on Alpine

Latest build of [n98-magerun](https://github.com/netz98/n98-magerun) 1.x utility intended to work with Magento 1.x framework. 

This build run under an Alpine Linux.

## How to use it

Create a shell function, ie:

```sh
n98() {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        -v $HOME/.n98-magerun:/.n98-magerun \
	    -v $(pwd):/mnt \
        -u `id -u`:`id -g` \
        --net=$DOCKER_NETWORK_NAME \
        soifou/n98-magerun-alpine ${@:1}
}
```

Where `DOCKER_NETWORK_NAME` is an existing docker network where your database container exists.

Reload your shell, then go to your Magento root directory and start using it with:

```sh
$ n98
```

## Database

Because you mount a volume from the current directory, if you want to use the database import command, 
the dump should be moved in the current directory.

You have to fill the path from the docker working directory, for example:

```sh
$ n98 db:import --compression='gzip' /mnt/dump.sql.gz
```

## Script repository

We map volume `~/.n98-magerun` to the container so you can also add your own command.
See [this article](http://magerun.net/use-n98-magerun-script-repository/) for details.

