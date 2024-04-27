FROM alpine as base

RUN apk update && apk add wget lftp

WORKDIR /out

FROM base

RUN mkdir /torrent

RUN echo '#!/bin/sh' > /usr/bin/torrent
RUN echo 'wget --directory-prefix=/torrent "$@"' >> /usr/bin/torrent
RUN echo 'lftp -c "module cmd-torrent; set torrent:seed-max-time 0s; set torrent:use-dht no; torrent /torrent/$(ls /torrent)"' >> /usr/bin/torrent
RUN chmod +x /usr/bin/torrent

ENTRYPOINT [ "/usr/bin/torrent" ]