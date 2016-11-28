FROM ruby:alpine

RUN \
  apk add --no-cache --virtual .dev-deps \
          build-base \

  && apk add --no-cache \
          ruby-dev \
          sqlite-dev \
          sqlite \

  && gem install mailcatcher --no-ri --no-rdoc \

  && apk del .dev-deps

EXPOSE 1025 1080

CMD ["mailcatcher", "-f", "--ip=0.0.0.0"]