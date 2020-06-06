Fluentular
[![Heroku App](https://img.shields.io/badge/heroku-ready-430098.svg?style=flat-square&logo=heroku&logoColor=white)](https://fluentular.herokuapp.com)
[![LICENSE](https://img.shields.io/github/license/tomohiro/fluentular.svg?style=flat-square)](LICENSE)
================================================================================

a Fluentd regular expression editor

[![Docker Pulls](https://img.shields.io/docker/pulls/tomohiro/fluentular.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tomohiro/fluentular/)
[![Build Status](https://img.shields.io/travis/com/tomohiro/fluentular.svg?style=flat-square&logo=travis)](https://travis-ci.com/tomohiro/fluentular)
[![Coverage Status](https://img.shields.io/coveralls/tomohiro/fluentular.svg?style=flat-square&logo=coveralls)](https://coveralls.io/github/tomohiro/fluentular)
[![Code Climate](https://img.shields.io/codeclimate/maintainability-percentage/tomohiro/fluentular.svg?style=flat-square&logo=code-climate)](https://codeclimate.com/github/tomohiro/fluentular)
[![Dependabot](https://img.shields.io/badge/dependabot-enabled-success?style=flat-square&logo=dependabot)](https://libraries.io/github/tomohiro/fluentular)


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

You can download and run Fluentular container from [DockerHub](https://registry.hub.docker.com/r/tomohiro/fluentular):

```
$ docker pull tomohiro/fluentular
$ docker run -d -p 8080:8080 tomohiro/fluentular
```

### AWS Elastic Beanstalk

Supported Platforms:

Platform | Version
-------- | ---------------------------------------------------------------------
Ruby     | Ruby 2.7.1 (Puma)
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

&copy; 2012 - 2020 Tomohiro Taira.

This project licensed under the MIT license. See [LICENSE](LICENSE) for details.


times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.033  000.033: --- VIM STARTING ---
000.266  000.233: Allocated generic buffers
002.509  002.243: locale set
002.517  000.008: clipboard setup
002.532  000.015: window checked
003.985  001.453: inits 1
004.008  000.023: parsing arguments
004.010  000.002: expanding arguments
021.743  017.733: shell init
022.767  001.024: Termcap init
022.807  000.040: inits 2
023.123  000.316: init highlight
029.636  004.605  004.605: sourcing /Users/tomohiro.taira/.vim/autoload/plug.vim
158.773  000.063  000.063: sourcing /usr/local/share/vim/vimfiles/ftdetect/pullrequest.vim
159.096  121.824  121.761: sourcing /usr/local/share/vim/vim82/filetype.vim
160.156  000.107  000.107: sourcing /usr/local/share/vim/vim82/ftplugin.vim
162.317  001.351  001.351: sourcing /usr/local/share/vim/vim82/indent.vim
208.361  003.917  003.917: sourcing /usr/local/share/vim/vim82/syntax/syncolor.vim
216.938  013.637  009.720: sourcing /usr/local/share/vim/vim82/syntax/synload.vim
217.899  035.769  022.132: sourcing /usr/local/share/vim/vim82/syntax/syntax.vim
221.607  000.387  000.387: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/init.vim
223.748  000.266  000.266: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/parts.vim
225.512  005.253  004.600: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/section.vim
230.182  001.652  001.652: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/highlighter.vim
233.925  000.425  000.425: sourcing /usr/local/share/vim/vim82/syntax/syncolor.vim
238.490  002.486  002.486: sourcing /usr/local/share/vim/vim82/syntax/syncolor.vim
240.439  000.245  000.245: sourcing /Users/tomohiro.taira/.vim/plugged/onedark.vim/autoload/onedark.vim
374.177  141.945  138.789: sourcing /Users/tomohiro.taira/.vim/plugged/onedark.vim/colors/onedark.vim
374.440  349.934  037.428: sourcing $HOME/.vimrc
374.553  001.496: sourcing vimrc file(s)
377.323  000.043  000.043: sourcing /usr/local/share/vim/vim82/filetype.vim
378.145  000.030  000.030: sourcing /usr/local/share/vim/vim82/ftplugin.vim
378.860  000.027  000.027: sourcing /usr/local/share/vim/vim82/indent.vim
393.710  004.044  004.044: sourcing /usr/local/Cellar/vim/8.2.0750/share/vim/vim82/pack/dist/opt/matchit/plugin/matchit.vim
394.023  010.395  006.351: sourcing /usr/local/share/vim/vim82/macros/matchit.vim
394.260  018.605  008.110: sourcing /Users/tomohiro.taira/.vim/plugged/vim-sensible/plugin/sensible.vim
403.090  005.762  005.762: sourcing /Users/tomohiro.taira/.vim/plugged/editorconfig-vim/plugin/editorconfig.vim
441.846  032.334  032.334: sourcing /Users/tomohiro.taira/.vim/plugged/nerdcommenter/plugin/NERD_commenter.vim
445.348  001.213  001.213: sourcing /Users/tomohiro.taira/.vim/plugged/vim-trailing-whitespace/plugin/trailing-whitespace.vim
449.287  000.040  000.040: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/autoloclist.vim
449.985  000.035  000.035: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/balloons.vim
450.547  000.037  000.037: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/checker.vim
451.039  000.032  000.032: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/cursor.vim
451.579  000.036  000.036: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/highlighting.vim
452.285  000.034  000.034: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/loclist.vim
452.699  000.034  000.034: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/modemap.vim
453.095  000.036  000.036: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/notifiers.vim
453.482  000.026  000.026: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/registry.vim
453.895  000.028  000.028: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/signs.vim
457.785  002.119  002.119: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/autoload/syntastic/util.vim
3513.919  000.203  000.203: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/autoloclist.vim
3514.463  000.138  000.138: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/balloons.vim
3515.840  000.989  000.989: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/checker.vim
3516.616  000.237  000.237: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/cursor.vim
3517.387  000.189  000.189: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/highlighting.vim
3521.186  003.430  003.430: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/loclist.vim
3521.710  000.144  000.144: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/modemap.vim
3522.061  000.105  000.105: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/notifiers.vim
3523.022  000.730  000.730: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/registry.vim
3523.889  000.571  000.571: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/signs.vim
3526.348  3072.089  3062.234: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic.vim
3528.062  000.365  000.365: sourcing /Users/tomohiro.taira/.vim/plugged/neocomplete/plugin/neocomplete/buffer.vim
3528.719  000.363  000.363: sourcing /Users/tomohiro.taira/.vim/plugged/neocomplete/plugin/neocomplete/dictionary.vim
3529.263  000.260  000.260: sourcing /Users/tomohiro.taira/.vim/plugged/neocomplete/plugin/neocomplete/member.vim
3529.795  000.258  000.258: sourcing /Users/tomohiro.taira/.vim/plugged/neocomplete/plugin/neocomplete/tag.vim
3530.427  000.354  000.354: sourcing /Users/tomohiro.taira/.vim/plugged/neocomplete/plugin/neocomplete.vim
3532.543  000.907  000.907: sourcing /Users/tomohiro.taira/.vim/plugged/vim-indent-guides/autoload/indent_guides.vim
3533.192  002.243  001.336: sourcing /Users/tomohiro.taira/.vim/plugged/vim-indent-guides/plugin/indent_guides.vim
3534.603  000.896  000.896: sourcing /Users/tomohiro.taira/.vim/plugged/vim-signify/plugin/signify.vim
3538.372  003.223  003.223: sourcing /Users/tomohiro.taira/.vim/plugged/vim-devicons/plugin/webdevicons.vim
3541.346  000.825  000.825: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/util.vim
3541.573  002.614  001.789: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/plugin/airline.vim
3542.309  000.323  000.323: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline-themes/plugin/airline-themes.vim
3543.692  000.354  000.354: sourcing /usr/local/share/vim/vim82/plugin/getscriptPlugin.vim
3544.530  000.612  000.612: sourcing /usr/local/share/vim/vim82/plugin/gzip.vim
3545.502  000.726  000.726: sourcing /usr/local/share/vim/vim82/plugin/logiPat.vim
3546.033  000.271  000.271: sourcing /usr/local/share/vim/vim82/plugin/manpager.vim
3546.914  000.634  000.634: sourcing /usr/local/share/vim/vim82/plugin/matchparen.vim
3548.509  001.313  001.313: sourcing /usr/local/share/vim/vim82/plugin/netrwPlugin.vim
3549.110  000.231  000.231: sourcing /usr/local/share/vim/vim82/plugin/rrhelper.vim
3549.744  000.386  000.386: sourcing /usr/local/share/vim/vim82/plugin/spellfile.vim
3550.466  000.472  000.472: sourcing /usr/local/share/vim/vim82/plugin/tarPlugin.vim
3551.231  000.526  000.526: sourcing /usr/local/share/vim/vim82/plugin/tohtml.vim
3552.250  000.521  000.521: sourcing /usr/local/share/vim/vim82/plugin/vimballPlugin.vim
3553.278  000.637  000.637: sourcing /usr/local/share/vim/vim82/plugin/zipPlugin.vim
3553.356  030.880: loading plugins
3553.706  000.350: loading packages
3553.832  000.126: loading after plugins
3553.852  000.020: inits 3
3554.705  000.853: reading viminfo
3554.753  000.048: setting raw mode
3554.790  000.037: start termcap
3554.833  000.043: clearing screen
3560.962  001.027  001.027: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/autoload/syntastic/log.vim
3563.034  001.034  001.034: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions.vim
3564.228  000.404  000.404: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/quickfix.vim
3565.960  000.983  000.983: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline.vim
3567.212  000.322  000.322: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/netrw.vim
3568.564  000.649  000.649: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/term.vim
3569.687  000.398  000.398: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/hunks.vim
3571.155  000.494  000.494: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/syntastic.vim
3572.680  000.729  000.729: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/whitespace.vim
3574.405  000.402  000.402: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/po.vim
3575.718  000.472  000.472: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/wordcount.vim
3577.472  000.599  000.599: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline.vim
3578.306  000.295  000.295: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline/autoshow.vim
3579.741  000.786  000.786: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline/tabs.vim
3581.202  000.534  000.534: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline/buffers.vim
3582.234  000.276  000.276: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/keymap.vim
3595.318  000.259  000.259: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/themes.vim
3595.686  001.100  000.841: sourcing /Users/tomohiro.taira/.vim/plugged/iceberg.vim/autoload/airline/themes/iceberg.vim
3607.558  000.621  000.621: sourcing /Users/tomohiro.taira/.vim/plugged/iceberg.vim/autoload/airline/themes/iceberg.vim
3641.987  000.947  000.947: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/builder.vim
3643.292  000.402  000.402: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/default.vim
3677.932  110.625: opening buffers
3680.724  001.233  001.233: sourcing /Users/tomohiro.taira/.vim/plugged/vim-signify/autoload/sy.vim
3681.114  001.949: BufEnter autocommands
3681.118  000.004: editing files in windows
3683.973  002.855: VimEnter autocommands
3683.976  000.003: before starting main loop
3688.022  001.324  001.324: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline/ctrlspace.vim
3689.793  000.436  000.436: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline/tabws.vim
3697.697  006.851  006.851: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline/builder.vim
3700.239  000.841  000.841: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline/buflist.vim
3718.803  009.054  009.054: sourcing /Users/tomohiro.taira/.vim/plugged/vim-devicons/autoload/airline/extensions/tabline/formatters/webdevicons.vim
3720.628  000.335  000.335: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline/formatters/default.vim
3730.304  027.487: first screen update
3730.306  000.002: --- VIM STARTED ---


times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.038  000.038: --- VIM STARTING ---
000.270  000.232: Allocated generic buffers
001.893  001.623: locale set
001.900  000.007: clipboard setup
001.914  000.014: window checked
007.733  005.819: inits 1
007.755  000.022: parsing arguments
007.757  000.002: expanding arguments
021.340  013.583: shell init
023.692  002.352: Termcap init
023.730  000.038: inits 2
024.039  000.309: init highlight
031.241  005.436  005.436: sourcing /Users/tomohiro.taira/.vim/autoload/plug.vim
068.035  000.050  000.050: sourcing /usr/local/share/vim/vimfiles/ftdetect/pullrequest.vim
068.343  023.321  023.271: sourcing /usr/local/share/vim/vim82/filetype.vim
070.730  000.130  000.130: sourcing /usr/local/share/vim/vim82/ftplugin.vim
071.569  000.098  000.098: sourcing /usr/local/share/vim/vim82/indent.vim
075.386  001.902  001.902: sourcing /usr/local/share/vim/vim82/syntax/syncolor.vim
075.769  002.991  001.089: sourcing /usr/local/share/vim/vim82/syntax/synload.vim
075.918  003.902  000.911: sourcing /usr/local/share/vim/vim82/syntax/syntax.vim
083.808  000.319  000.319: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/init.vim
086.584  000.277  000.277: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/parts.vim
092.603  014.682  014.086: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/section.vim
100.264  001.032  001.032: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/highlighter.vim
102.576  000.245  000.245: sourcing /usr/local/share/vim/vim82/syntax/syncolor.vim
103.621  000.243  000.243: sourcing /usr/local/share/vim/vim82/syntax/syncolor.vim
105.244  000.259  000.259: sourcing /Users/tomohiro.taira/.vim/plugged/onedark.vim/autoload/onedark.vim
166.394  065.007  064.260: sourcing /Users/tomohiro.taira/.vim/plugged/onedark.vim/colors/onedark.vim
166.614  141.240  027.632: sourcing $HOME/.vimrc
166.651  001.372: sourcing vimrc file(s)
167.943  000.020  000.020: sourcing /usr/local/share/vim/vim82/filetype.vim
168.363  000.016  000.016: sourcing /usr/local/share/vim/vim82/ftplugin.vim
168.761  000.017  000.017: sourcing /usr/local/share/vim/vim82/indent.vim
174.173  000.914  000.914: sourcing /usr/local/Cellar/vim/8.2.0750/share/vim/vim82/pack/dist/opt/matchit/plugin/matchit.vim
174.434  004.098  003.184: sourcing /usr/local/share/vim/vim82/macros/matchit.vim
174.622  007.124  002.973: sourcing /Users/tomohiro.taira/.vim/plugged/vim-sensible/plugin/sensible.vim
178.214  001.435  001.435: sourcing /Users/tomohiro.taira/.vim/plugged/editorconfig-vim/plugin/editorconfig.vim
189.126  010.103  010.103: sourcing /Users/tomohiro.taira/.vim/plugged/nerdcommenter/plugin/NERD_commenter.vim
190.083  000.144  000.144: sourcing /Users/tomohiro.taira/.vim/plugged/vim-trailing-whitespace/plugin/trailing-whitespace.vim
191.582  000.027  000.027: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/autoloclist.vim
191.779  000.025  000.025: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/balloons.vim
191.957  000.016  000.016: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/checker.vim
192.127  000.015  000.015: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/cursor.vim
192.298  000.014  000.014: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/highlighting.vim
192.469  000.014  000.014: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/loclist.vim
192.655  000.014  000.014: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/modemap.vim
192.833  000.018  000.018: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/notifiers.vim
193.008  000.014  000.014: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/registry.vim
193.261  000.022  000.022: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/signs.vim
195.434  001.243  001.243: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/autoload/syntastic/util.vim
3344.639  000.155  000.155: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/autoloclist.vim
3345.067  000.136  000.136: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/balloons.vim
3345.902  000.552  000.552: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/checker.vim
3346.541  000.235  000.235: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/cursor.vim
3347.039  000.194  000.194: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/highlighting.vim
3348.008  000.671  000.671: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/loclist.vim
3348.379  000.138  000.138: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/modemap.vim
3348.697  000.121  000.121: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/notifiers.vim
3349.370  000.497  000.497: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/registry.vim
3349.712  000.152  000.152: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic/signs.vim
3351.263  3157.783  3153.689: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/plugin/syntastic.vim
3352.201  000.082  000.082: sourcing /Users/tomohiro.taira/.vim/plugged/neocomplete/plugin/neocomplete/buffer.vim
3352.484  000.067  000.067: sourcing /Users/tomohiro.taira/.vim/plugged/neocomplete/plugin/neocomplete/dictionary.vim
3352.735  000.060  000.060: sourcing /Users/tomohiro.taira/.vim/plugged/neocomplete/plugin/neocomplete/member.vim
3352.981  000.059  000.059: sourcing /Users/tomohiro.taira/.vim/plugged/neocomplete/plugin/neocomplete/tag.vim
3353.332  000.156  000.156: sourcing /Users/tomohiro.taira/.vim/plugged/neocomplete/plugin/neocomplete.vim
3355.439  000.391  000.391: sourcing /Users/tomohiro.taira/.vim/plugged/vim-indent-guides/autoload/indent_guides.vim
3356.337  002.126  001.735: sourcing /Users/tomohiro.taira/.vim/plugged/vim-indent-guides/plugin/indent_guides.vim
3358.765  001.027  001.027: sourcing /Users/tomohiro.taira/.vim/plugged/vim-signify/plugin/signify.vim
3364.933  004.466  004.466: sourcing /Users/tomohiro.taira/.vim/plugged/vim-devicons/plugin/webdevicons.vim
3367.013  000.244  000.244: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/util.vim
3367.204  001.589  001.345: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/plugin/airline.vim
3367.697  000.070  000.070: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline-themes/plugin/airline-themes.vim
3369.239  000.188  000.188: sourcing /usr/local/share/vim/vim82/plugin/getscriptPlugin.vim
3370.388  000.822  000.822: sourcing /usr/local/share/vim/vim82/plugin/gzip.vim
3371.412  000.612  000.612: sourcing /usr/local/share/vim/vim82/plugin/logiPat.vim
3371.821  000.085  000.085: sourcing /usr/local/share/vim/vim82/plugin/manpager.vim
3372.529  000.426  000.426: sourcing /usr/local/share/vim/vim82/plugin/matchparen.vim
3374.316  001.460  001.460: sourcing /usr/local/share/vim/vim82/plugin/netrwPlugin.vim
3375.059  000.056  000.056: sourcing /usr/local/share/vim/vim82/plugin/rrhelper.vim
3375.502  000.081  000.081: sourcing /usr/local/share/vim/vim82/plugin/spellfile.vim
3376.432  000.558  000.558: sourcing /usr/local/share/vim/vim82/plugin/tarPlugin.vim
3377.147  000.272  000.272: sourcing /usr/local/share/vim/vim82/plugin/tohtml.vim
3378.102  000.558  000.558: sourcing /usr/local/share/vim/vim82/plugin/vimballPlugin.vim
3379.139  000.603  000.603: sourcing /usr/local/share/vim/vim82/plugin/zipPlugin.vim
3379.203  020.361: loading plugins
3379.540  000.337: loading packages
3379.675  000.135: loading after plugins
3379.696  000.021: inits 3
3380.442  000.746: reading viminfo
3380.493  000.051: setting raw mode
3380.529  000.036: start termcap
3380.579  000.050: clearing screen
3387.253  000.470  000.470: sourcing /Users/tomohiro.taira/.vim/plugged/syntastic/autoload/syntastic/log.vim
3389.266  000.823  000.823: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions.vim
3390.494  000.164  000.164: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/quickfix.vim
3391.306  000.287  000.287: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline.vim
3391.877  000.053  000.053: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/netrw.vim
3392.805  000.472  000.472: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/term.vim
3393.644  000.299  000.299: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/hunks.vim
3395.157  000.162  000.162: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/syntastic.vim
3396.658  000.352  000.352: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/whitespace.vim
3398.328  000.166  000.166: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/po.vim
3399.620  000.263  000.263: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/wordcount.vim
3401.085  000.487  000.487: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline.vim
3402.095  000.138  000.138: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline/autoshow.vim
3403.678  000.290  000.290: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline/tabs.vim
3405.275  000.474  000.474: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline/buffers.vim
3406.822  000.074  000.074: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/keymap.vim
3429.563  000.168  000.168: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/themes.vim
3430.146  003.088  002.920: sourcing /Users/tomohiro.taira/.vim/plugged/iceberg.vim/autoload/airline/themes/iceberg.vim
3442.743  000.700  000.700: sourcing /Users/tomohiro.taira/.vim/plugged/iceberg.vim/autoload/airline/themes/iceberg.vim
3500.383  000.654  000.654: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/builder.vim
3502.199  000.329  000.329: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/default.vim
3543.729  153.405: opening buffers
3546.818  000.477  000.477: sourcing /Users/tomohiro.taira/.vim/plugged/vim-signify/autoload/sy.vim
3547.196  002.990: BufEnter autocommands
3547.200  000.004: editing files in windows
3552.156  004.956: VimEnter autocommands
3552.159  000.003: before starting main loop
3554.672  000.699  000.699: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline/ctrlspace.vim
3556.715  000.720  000.720: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline/tabws.vim
3562.507  000.596  000.596: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline/builder.vim
3566.872  003.258  003.258: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline/buflist.vim
3583.546  000.099  000.099: sourcing /Users/tomohiro.taira/.vim/plugged/vim-devicons/autoload/airline/extensions/tabline/formatters/webdevicons.vim
3584.717  000.229  000.229: sourcing /Users/tomohiro.taira/.vim/plugged/vim-airline/autoload/airline/extensions/tabline/formatters/default.vim
3602.344  044.584: first screen update
3602.349  000.005: --- VIM STARTED ---
