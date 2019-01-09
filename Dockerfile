# Build for install dependency RubyGems
FROM ruby:2.6.0-alpine3.8 AS bundle

COPY Gemfile .
COPY Gemfile.lock .

RUN set -ex \
    && apk add --update --no-cache build-base=0.5-r1 \
    && bundle install --frozen --jobs=4 --without="test:development" \
    && rm -rf "${BUNDLE_PATH}/cache/*"

# Build for Sinatra app
FROM ruby:2.6.0-alpine3.8
COPY --from=bundle /usr/local/bundle /usr/local/bundle

ENV RACK_ENV=deployment

WORKDIR /usr/src/app
COPY . .

EXPOSE 8080
ENTRYPOINT ["rackup"]
CMD ["--host", "0.0.0.0", "-p", "8080"]
