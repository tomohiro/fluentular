FROM        ruby:2.2-onbuild
MAINTAINER  Tomohiro TAIRA <tomohiro.t@gmail.com>

EXPOSE      3000
ENTRYPOINT  ["bundle", "exec", "rackup"]
CMD         ["--host", "0.0.0.0", "-p", "3000"]
