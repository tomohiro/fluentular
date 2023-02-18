# Fluentular [![Heroku App](https://img.shields.io/badge/heroku-ready-430098.svg?style=flat-square&logo=heroku&logoColor=white)](https://fluentular.herokuapp.com) [![LICENSE](https://img.shields.io/github/license/tomohiro/fluentular.svg?style=flat-square)](LICENSE)

a Fluentd regular expression editor

[![Docker Pulls](https://img.shields.io/docker/pulls/tomohiro/fluentular.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tomohiro/fluentular/)
[![Build Status](https://img.shields.io/github/actions/workflow/status/tomohiro/fluentular/.github/workflows/test.yml?branch=main&logo=github&style=flat-square)](https://github.com/tomohiro/fluentular/actions)
[![Coverage Status](https://img.shields.io/coveralls/tomohiro/fluentular.svg?style=flat-square&logo=coveralls)](https://coveralls.io/github/tomohiro/fluentular)
[![Code Climate](https://img.shields.io/codeclimate/maintainability-percentage/tomohiro/fluentular.svg?style=flat-square&logo=code-climate)](https://codeclimate.com/github/tomohiro/fluentular)
[![Dependabot](https://img.shields.io/badge/dependabot-enabled-success?style=flat-square&logo=dependabot)](https://github.com/tomohiro/fluentular/network/dependencies)


![Fluentular Screenshot](https://user-images.githubusercontent.com/54254/100218981-c85b8280-2f58-11eb-8cab-856c1e09c48e.png)


Platforms
--------------------------------------------------------------------------------

- [Heroku](#heroku)
- [Docker](#docker)


### Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)


### Docker

You can download and run Fluentular container from [DockerHub](https://hub.docker.com/r/tomohiro/fluentular/):

```
$ docker pull tomohiro/fluentular:latest
$ docker run -d -p 8080:8080 tomohiro/fluentular:latest
```

#### Own build

Also you can build the app when after clone this repository:

```
$ cd fluentular
$ docker compose up -d
$ docker compose ps
NAME                COMMAND                  SERVICE             STATUS              PORTS
fluentular-app-1    "bundle exec rackup …"   app                 running (healthy)   0.0.0.0:8080->8080/tcp
```


Acknowledgment
-------------------------------------------------------------------------------

- [fluentdのformat(正規表現)の作り方について試行錯誤中 #fluentd - Glide Note - グライドノート](http://blog.glidenote.com/blog/2012/07/15/fluentd-regex-debug/)
- [Fluentdでparser用の正規表現を書く・試す - tagomorisのメモ置き場](http://d.hatena.ne.jp/tagomoris/20120715/1342368392)
- [Scriptular](http://scriptular.com/)
- [Rubular: a Ruby regular expression editor and tester](http://rubular.com/)


LICENSE
--------------------------------------------------------------------------------

&copy; 2012 - 2023 Tomohiro Taira.

This project licensed under the MIT license. See [LICENSE](LICENSE) for details.
