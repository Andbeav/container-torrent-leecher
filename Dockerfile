FROM alpine

RUN apk update && apk add wget lftp

RUN echo 'torrent;set torrent:seed-max-time 0d' >> /etc/lftp.conf
RUN mkdir /torrent /out

RUN echo '#!/bin/sh' > /usr/bin/torrent
RUN echo 'wget --directory-prefix=/torrent "$@"' >> /usr/bin/torrent
RUN echo 'lftp -c "torrent /torrent/$(ls /torrent)"' >> /usr/bin/torrent
RUN chmod +x /usr/bin/torrent

WORKDIR /out

ENTRYPOINT [ "/usr/bin/torrent" ]