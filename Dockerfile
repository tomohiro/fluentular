# Build for install dependency RubyGems
FROM ruby:2.7.4-alpine3.14 AS bundle

WORKDIR /tmp
COPY Gemfile .
COPY Gemfile.lock .

RUN set -ex \
    && apk add --update --no-cache curl build-base \
    && bundle config frozen true \
    && bundle install --jobs=4 --without="test:development" \
    && rm -rf "${BUNDLE_PATH}/cache/*"

# Build for Sinatra app
FROM ruby:2.7.4-alpine3.14
COPY --from=bundle ${BUNDLE_PATH} ${BUNDLE_PATH}

ENV RACK_ENV=deployment

WORKDIR /usr/src/app
COPY . .

EXPOSE 8080
ENTRYPOINT ["bundle"]
CMD ["exec", "rackup", "--host", "0.0.0.0", "-p", "8080"]

HEALTHCHECK CMD curl -s -S -o /dev/null http:/0:8080 || exit 1
