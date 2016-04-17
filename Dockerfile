FROM        ruby:2.3-onbuild
MAINTAINER  Tomohiro TAIRA <tomohiro.t@gmail.com>

EXPOSE      8080
ENTRYPOINT  ["bundle", "exec", "rackup"]
CMD         ["--host", "0.0.0.0", "-p", "8080"]
