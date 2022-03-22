# Build for install dependency RubyGems
FROM ruby:3.1.1-alpine3.15 AS bundle

WORKDIR /tmp
COPY Gemfile .
COPY Gemfile.lock .

RUN set -ex \
    && apk add --update --no-cache curl build-base \
    && bundle config set frozen true \
    && bundle config set without 'test:development' \
    && bundle install --jobs=4 \
    && rm -rf "${GEM_HOME}/cache/*"

# Build for Sinatra app
FROM ruby:3.1.1-alpine3.15
COPY --from=bundle ${GEM_HOME} ${GEM_HOME}

ENV RACK_ENV=deployment

WORKDIR /usr/src/app
COPY . .

EXPOSE 8080
ENTRYPOINT ["bundle"]
CMD ["exec", "rackup", "--host", "0.0.0.0", "-p", "8080"]

HEALTHCHECK CMD wget -q -O /dev/null http://0:8080 || exit 1
