Fluentular
================================================================================

a Fluentd regular expression editor

[![Stillmaintained](http://stillmaintained.com/Tomohiro/fluentular.png)](http://stillmaintained.com/Tomohiro/fluentular)
[![Dependency Status](https://img.shields.io/gemnasium/Tomohiro/fluentular.svg?style=flat-square)](https://gemnasium.com/Tomohiro/fluentular)
[![Build Status](https://img.shields.io/travis/Tomohiro/fluentular.svg?style=flat-square)](https://travis-ci.org/Tomohiro/fluentular)
[![Coverage Status](https://img.shields.io/coveralls/Tomohiro/fluentular.svg?style=flat-square)](https://coveralls.io/github/Tomohiro/fluentular)
[![Docker Support](http://img.shields.io/badge/docker-support-blue.svg?style=flat-square)](https://registry.hub.docker.com/u/tomohiro/fluentular)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](LICENSE)


![Fluentular Screenshot](https://cloud.githubusercontent.com/assets/54254/6202037/ed7a9662-b512-11e4-93a5-3640aaf900a5.png)


### Heroku Ready

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)


### :whale: Docker Support

You can download and run fluentular container from [DockerHub](https://registry.hub.docker.com/u/tomohiro/fluentular/):

```
$ docker pull tomohiro/fluentular
$ docker run -d -p 3000:3000 tomohiro/fluentular
```

### :seedling: Elastic Beanstalk Support

Supported Platforms:

Platform | Version
-------- | ---------------------------------------------------------------------
Ruby     | Ruby 2.2 (Puma)
Docker   | 1.7.1

Create an Application:

```sh
$ eb init
```

Create an Environment:

```sh
$ eb create
```

See [Deploying a Sinatra Application to AWS Elastic Beanstalk - Elastic Beanstalk](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_Ruby_sinatra.html)


Inspired
-------------------------------------------------------------------------------

- [fluentdのformat(正規表現)の作り方について試行錯誤中 #fluentd - Glide Note - グライドノート](http://blog.glidenote.com/blog/2012/07/15/fluentd-regex-debug/)
- [Fluentdでparser用の正規表現を書く・試す - tagomorisのメモ置き場](http://d.hatena.ne.jp/tagomoris/20120715/1342368392)
- [Scriptular](http://scriptular.com/)
- [Rubular: a Ruby regular expression editor and tester](http://rubular.com/)


LICENSE
--------------------------------------------------------------------------------

&copy; 2012 - 2015 Tomohiro TAIRA.

This project licensed under the MIT license. See [LICENSE](LICENSE) for details.
