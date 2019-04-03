FROM python:2.7-alpine

ARG VERSION=v1.3_Crunchy_Frog

RUN wget http://weaver.nlplab.org/~brat/releases/brat-${VERSION}.tar.gz

RUN apk add --update --no-cache \
    lighttpd \
    openrc \
    vim \
    bash \
    tar \
    --no-cache

# ensure www-data user exists
RUN set -x ; \
  addgroup -g 82 -S www-data ; \
  adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1
  
# ensure www-data user exists
RUN set -x ; \
  addgroup -g 1001 -S brat ; \
  adduser -u 1001 -D -S -G brat brat && exit 0 ; exit 1

RUN mkdir -p /var/log/lighttpd \
 && chown -R brat:www-data /var/log/lighttpd
  
RUN mkdir /brat

RUN tar xzf brat-${VERSION}.tar.gz -C /brat --strip-components=1

RUN chown -R brat:brat /brat \
 && chmod -R 550 /brat

WORKDIR /brat

RUN ln -s /shared/brat-config.py /brat/config.py
RUN rm /etc/lighttpd/lighttpd.conf \
    && ln -s /shared/lighttpd.conf /etc/lighttpd/lighttpd.conf

RUN ln -s /usr/local/bin/python /usr/bin/python

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

CMD ["start.sh"]
