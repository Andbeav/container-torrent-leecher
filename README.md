# container-torrent-leecher

Image for downloading torrents without seeding. Utilizes the torrent functionality from [lftp](https://lftp.yar.ru/lftp-man.html).

# Installation

You can either build from the Dockerfile or pull the prebuilt image. I most likely won't push to docker hub.

## Building from Dockerfile

```sh
$ docker build -t torrent .
```

## Pulling the prebuilt image

```sh
$ docker pull ghcr.io/andbeav/torrent:latest
```

# Running the image

In order for progress updates to be displayed you will need to run it with these two options enabled:

* `--interactive` / `-i`
* `--tty` / `-t`

In order to save the downloaded content you need to specify a volume mount as well:

* `--volume` / `-v`

Example command:

```sh
$ docker run -it -v /your/save/path:/out torrent https://example.com/download/12345.torrent
```
