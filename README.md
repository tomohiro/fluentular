Fluentular
================================================================================

a Fluentd regular expression editor

[![Dependency Status](https://img.shields.io/librariesio/github/Tomohiro/fluentular.svg?style=flat-square)](https://libraries.io/github/Tomohiro/fluentular)
[![Build Status](https://img.shields.io/travis/Tomohiro/fluentular.svg?style=flat-square)](https://travis-ci.org/Tomohiro/fluentular)
[![Coverage Status](https://img.shields.io/coveralls/Tomohiro/fluentular.svg?style=flat-square)](https://coveralls.io/github/Tomohiro/fluentular)
[![Image Size](https://img.shields.io/microbadger/image-size/fedora%2Fapache.svg)](https://microbadger.com/images/tomohiro/fluentular)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](LICENSE)


![Fluentular Screenshot](https://cloud.githubusercontent.com/assets/54254/11119798/642cf592-898f-11e5-906d-527bef2db8c3.png)


Platforms
--------------------------------------------------------------------------------

- [Heroku](#heroku)
- [Docker](#docker)
- [AWS Elastic Beanstalk](#aws-elastic-beanstalk)
- [Google App Engine](#google-app-engine)


### Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)


### Docker

You can download and run Fluentular container from [DockerHub](https://registry.hub.docker.com/u/tomohiro/fluentular/):

```
$ docker pull tomohiro/fluentular
$ docker run -d -p 8080:8080 tomohiro/fluentular
```

### AWS Elastic Beanstalk

Supported Platforms:

Platform | Version
-------- | ---------------------------------------------------------------------
Ruby     | Ruby 2.2 (Puma)
Docker   | 1.7.1


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

&copy; 2012 - 2019 Tomohiro TAIRA.

This project licensed under the MIT license. See [LICENSE](LICENSE) for details.
