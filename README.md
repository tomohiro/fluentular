# Fluentular [![Heroku App](https://img.shields.io/badge/heroku-ready-430098.svg?style=flat-square&logo=heroku&logoColor=white)](https://fluentular.herokuapp.com) [![LICENSE](https://img.shields.io/github/license/tomohiro/fluentular.svg?style=flat-square)](LICENSE)

a Fluentd regular expression editor

[![Docker Pulls](https://img.shields.io/docker/pulls/tomohiro/fluentular.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tomohiro/fluentular/)
[![Build Status](https://img.shields.io/github/workflow/status/tomohiro/fluentular/Build?logo=github&style=flat-square)](https://github.com/tomohiro/fluentular/actions)
[![Coverage Status](https://img.shields.io/coveralls/tomohiro/fluentular.svg?style=flat-square&logo=coveralls)](https://coveralls.io/github/tomohiro/fluentular)
[![Code Climate](https://img.shields.io/codeclimate/maintainability-percentage/tomohiro/fluentular.svg?style=flat-square&logo=code-climate)](https://codeclimate.com/github/tomohiro/fluentular)
[![Dependabot](https://img.shields.io/badge/dependabot-enabled-success?style=flat-square&logo=dependabot)](https://github.com/tomohiro/fluentular/network/dependencies)


![Fluentular Screenshot](https://user-images.githubusercontent.com/54254/100218981-c85b8280-2f58-11eb-8cab-856c1e09c48e.png)


Platforms
--------------------------------------------------------------------------------

- [Heroku](#heroku)
- [Docker](#docker)
- [AWS Elastic Beanstalk](#aws-elastic-beanstalk)
- [Google App Engine](#google-app-engine)


### Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)


### Docker

You can download and run Fluentular container from [DockerHub](https://hub.docker.com/r/tomohiro/fluentular/):

```
$ docker pull tomohiro/fluentular:latest
$ docker run -d -p 8080:8080 tomohiro/fluentular:latest
```

### AWS Elastic Beanstalk

Supported Platforms:

Platform | Version
-------- | ---------------------------------------------------------------------
Ruby     | Ruby 2.7.4 (Puma)
Docker   | 18.09.0 or later


#### Using EB Command Line Interface

Create an Application:

```sh
$ eb init # Choose a platform from Ruby or Docker
```

Create an Environment:

```sh
$ eb create
```


#### Using AWS Console

You can use Dockerrun.aws.json when creating a new environment.

https://fluentular.s3.amazonaws.com/Dockerrun.aws.json

![Create a new environment](https://cloud.githubusercontent.com/assets/54254/11200269/0a94db62-8d18-11e5-8e9e-d9ccbd994eea.png)


For more information, see [Deploying a Sinatra Application to AWS Elastic Beanstalk - Elastic Beanstalk](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_Ruby_sinatra.html).


### Google App Engine

```sh
$ gcloud preview app deploy
```


Acknowledgment
-------------------------------------------------------------------------------

- [fluentdのformat(正規表現)の作り方について試行錯誤中 #fluentd - Glide Note - グライドノート](http://blog.glidenote.com/blog/2012/07/15/fluentd-regex-debug/)
- [Fluentdでparser用の正規表現を書く・試す - tagomorisのメモ置き場](http://d.hatena.ne.jp/tagomoris/20120715/1342368392)
- [Scriptular](http://scriptular.com/)
- [Rubular: a Ruby regular expression editor and tester](http://rubular.com/)


LICENSE
--------------------------------------------------------------------------------

&copy; 2012 - 2021 Tomohiro Taira.

This project licensed under the MIT license. See [LICENSE](LICENSE) for details.
