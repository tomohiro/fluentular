# enoding: utf-8

require 'sinatra'
require 'fluent/log'
require 'fluent/config'
require 'fluent/engine'
require 'fluent/parser'

set :haml, :format => :html5

get '/' do
  haml :index
end

get '/parse' do
  @regexp      = params[:regexp].gsub(/^\/(.+)\/$/, '\1')
  @input       = params[:input]
  @time_format = params[:time_format]
  @error       = nil

  begin
    parser = Fluent::TextParser::RegexpParser.new(Regexp.new(@regexp))
    parser.configure('time_format' => @time_format) if not @time_format.empty?
    @parsed_time, @parsed = parser.call(@input)
  rescue ArgumentError, RegexpError => e
    @error = e
    @parsed_time = @parsed = nil
  end

  haml :index
end

__END__

@@ layout
!!!
%html
  %head
    %meta(charset='UTF-8')
    %meta(name='viewport' content='width=device-width, initial-scale=1.0')
    %title Fluentular: a Fluentd regular expression editor
    %link(rel='stylesheet' href='//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css')
    %link(rel='stylesheet' href='//cdn.foundation5.zurb.com/foundation.css')
    :javascript
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', "#{ENV['UA_CODE']}"]);
      _gaq.push(['_trackPageview']);
      (function() {
        var ga = document.createElement('script');
        ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
    :css
      @import url(http://fonts.googleapis.com/css?family=Squada+One);
      body {
        border-top: 7px solid #2795b6;
        padding-top: 10px;
      }
      h1 {
        font-family: 'Squada One', cursive, sans-serif;
      }
      img.github {
        position: absolute;
        top: 0;
        right: 0;
        border: 0;
      }
  %body
    %a(href='http://github.com/Tomohiro/fluentular')
      %img.github(src='http://s3.amazonaws.com/github/ribbons/forkme_right_red_aa0000.png' alt='Fork me on GitHub')

    %header.row.small-centered.columns
      %section
        %h1
          %a(href='/') Fluentular
        %h4 a Fluentd regular expression editor

    %article
      = yield

    %footer.row.small-centered.columns
      %section.small-12.medium-4.columns
        %p
          &copy; 2012 - 2014
          %a(href='https://github.com/Tomohiro') Tomohiro TAIRA
      %section.small-12.medium-4.columns.medium-offset-4
        %p
          Powered by
          %a(href='http://www.sinatrarb.com/') Sinatra
          Hosted on
          %a(href='http://heroku.com') Heroku

@@ index
%div.row
  %section.small-12.medium-8.columns
    %form(method='GET' action='/parse')
      %label
        %i.fa.fa-asterisk
        Regular Expression
      %textarea(name='regexp' rows=5)&= @regexp

      %label
        %i.fa.fa-gavel
        Test String
      %textarea(name='input' rows=5)&= @input

      %label
        %i.fa.fa-clock-o
        Custom Time Format (see also ruby document;
        %a(href='http://docs.ruby-lang.org/en/2.1.0/Time.html#method-i-strptime') strptime)
      %textarea(name='time_format' rows=1)&= @time_format

      - if @error
        %span.alert-box.alert.radius
          %i.fa.fa-exclamation-triangle
          Error:
          &= @error

      %input.radius.button(type='submit' value='Parse')


  %aside.small-12.medium-4.columns
    %div.panel.callout.radius
      %h4 Examples
      %h5
        %i.fa.fa-check-square-o
        Apache
      %h6
        Regular expression:
      %code
        & ^(?&lt;host&gt;[^ ]*) [^ ]* (?&lt;user&gt;[^ ]*) \[(?&lt;time&gt;[^\]]*)\] "(?&lt;method&gt;\S+)(?: +(?&lt;path&gt;[^ ]*) +\S*)?" (?&lt;code&gt;[^ ]*) (?&lt;size&gt;[^ ]*)(?: "(?&lt;referer&gt;[^\"]*)" "(?&lt;agent&gt;[^\"]*)")?$
      %h6
        Time Format:
      %code
        & %d/%b/%Y:%H:%M:%S %z
      %h5
        %i.fa.fa-check-square-o
        Syslog
      %h6
        Regular expression:
      %code
        & ^(?&lt;time&gt;[^ ]* [^ ]* [^ ]*) (?&lt;host&gt;[^ ]*) (?&lt;ident&gt;[a-zA-Z0-9_\/\.\-]*)(?:\[(?&lt;pid&gt;[0-9]+)\])?[^\:]*\: *(?&lt;message&gt;.*)$
      %h6
        Time Format:
      %code
        & %b %d %H:%M:%S

%div.row
  %section.small-12.small-centered.columns
    %h4 Configuration
    %p Copy and paste to <code>fluent.conf</code> or <code>td-agent.conf</code>
    %div.panel
      & &lt;source&gt;
      %br/
      & &nbsp;&nbsp;type tail
      %br/
      & &nbsp;&nbsp;path /var/log/foo/bar.log
      %br/
      & &nbsp;&nbsp;pos_file /var/log/td-agent/foo-bar.log.pos
      %br/
      & &nbsp;&nbsp;tag foo.bar
      %br/
      & &nbsp;&nbsp;format /#{@regexp}/
      %br/
      - if @time_format and !@time_format.empty?
        & &nbsp;&nbsp;time_format #{@time_format}
        %br/
      & &lt;/source&gt;

%div.row
  %section.small-12.small-centered.columns
    %h4 Data Inspector
    %h5 Attribute
    %table.small-12
      %thead
        %tr
          %th.small-4 Key
          %th.small-8 Value
      %tbody
        - if @parsed
          %tr
            %th.small-4 time
            %td.small-8 #{Time.at(@parsed_time).strftime("%Y/%m/%d %H:%M:%S")}
        - else
          %tr
            %th.small-4
            %td.small-12
    %h5 Record
    %table.small-12
      %thead
        %tr
          %th.small-4 Key
          %th.small-8 Value
      %tbody
        - if @parsed
          - @parsed.each do |key, value|
            %tr
              %th&= key
              %td&= value
        - else
          %tr
            %th
            %td
