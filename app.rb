# enoding: utf-8

require 'sinatra'
require 'fluent/version'
require 'fluent/log'
require 'fluent/config'
require 'fluent/plugin'
require 'fluent/engine'
require 'fluent/parser'
require 'tilt/haml'

set :haml, format: :html5

get '/' do
  haml :index
end

get '/parse' do
  @regexp      = params[:regexp].gsub(%r{^\/(.+)\/$}, '\1')
  @input       = params[:input]
  @time_format = params[:time_format]
  @error       = nil

  begin
    parser = Fluent::TextParser::RegexpParser.new(Regexp.new(@regexp))
    unless @time_format.empty?
      parser.configure(
        Fluent::Config::Element.new('', '', { 'time_format' => @time_format }, [])
      )
    end

    parser.call(@input) do |parsed_time, parsed|
      @parsed_time = parsed_time
      @parsed      = parsed
    end
  rescue Fluent::TextParser::ParserError, RegexpError => e
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
    %link(rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/foundation/5.5.0/css/normalize.min.css')
    %link(rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/foundation/5.5.0/css/foundation.min.css')
    %script(src='//cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js')
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
      h3 {
        margin: 40px 0px 20px;
        border-bottom: 1px solid #eee;
      }
      pre#code-example {
        padding: 0.125rem 0.3125rem 0.0625rem;
        background-color: #f8f8f8;
        border: 1px solid #dfdfdf;
        white-space: pre-wrap;
      }
      code {
        padding: 0px;
        border: none;
      }
      i.fa-heart {
        color: #ff79c6;
      }
      /* GitHub Courners from http://tholman.com/github-corners */
      .octo-icon {
        fill: #2795b6;
        color: #fff;
        position: absolute;
        top: 0;
        border: 0;
        right: 0;
      }
      .github-corner:hover .octo-arm {
        animation:octocat-wave 560ms ease-in-out;
      }
      @keyframes octocat-wave {
        0%,100% { transform: rotate(0); }
        20%,60% { transform: rotate(-25deg); }
        40%,80% { transform: rotate(10deg); }
      }
      @media (max-width:500px) {
        .github-corner:hover .octo-arm {
          animation: none;
        }
        .github-corner .octo-arm {
          animation: octocat-wave 560ms ease-in-out;
        }
      }
  %body
    %a.github-corner(href='https://github.com/Tomohiro/fluentular')
      %svg.octo-icon(width='80px' height='80px' viewBox='0 0 250 250')
        %path(d='M0,0 L115,115 L130,115 L142,142 L250,250 L250,0 Z')
        %path.octo-arm(fill='currentColor' d='M128.3,109.0 C113.8,99.7 119.0,89.6 119.0,89.6 C122.0,82.7 120.5,78.6 120.5,78.6 C119.2,72.0 123.4,76.3 123.4,76.3 C127.3,80.9 125.5,87.3 125.5,87.3 C122.9,97.6 130.6,101.9 134.4,103.2' style='transform-origin: 130px 106px')
        %path.octo-body(fill='currentColor' d='M115.0,115.0 C114.9,115.1 118.7,116.5 119.8,115.4 L133.7,101.6 C136.9,99.2 139.9,98.4 142.2,98.6 C133.8,88.0 127.5,74.4 143.8,58.0 C148.5,53.4 154.0,51.2 159.7,51.0 C160.3,49.4 163.2,43.6 171.4,40.1 C171.4,40.1 176.1,42.5 178.8,56.2 C183.1,58.6 187.2,61.8 190.9,65.4 C194.5,69.0 197.7,73.2 200.1,77.6 C213.8,80.2 216.3,84.9 216.3,84.9 C212.7,93.1 206.9,96.0 205.4,96.6 C205.1,102.4 203.0,107.8 198.3,112.5 C181.9,128.9 168.3,122.5 157.7,114.1 C157.9,116.9 156.7,120.9 152.7,124.9 L141.0,136.5 C139.8,137.7 141.6,141.9 141.8,141.8 Z')
    %header.row.small-centered.columns
      %section
        %h1
          %a(href='/') Fluentular
          %img(src='https://img.shields.io/badge/fluentd-v#{Fluent::VERSION}-orange.svg?style=flat-square')
        %h4 a Fluentd regular expression editor

    %article
      = yield

    %footer.row.small-centered.columns
      %section.small-12.columns
        %p
          &copy; 2012 - 2016 Made with
          %i.fa.fa-heart
          by
          %a(href='https://github.com/Tomohiro') Tomohiro TAIRA

@@ index
%div.row
  %section.small-12.medium-8.columns
    %form(method='GET' action='/parse')
      %label
        %i.fa.fa-code
        Regular Expression
      %textarea(name='regexp' rows=5)&= @regexp

      %label
        %i.fa.fa-quote-left
        Test String
      %textarea(name='input' rows=5)&= @input

      %label
        %i.fa.fa-clock-o
        Custom Time Format (see also ruby document;
        %a(href='http://docs.ruby-lang.org/en/2.2.0/Time.html#method-i-strptime') strptime)
      %textarea(name='time_format' rows=1)&= @time_format

      - if @error
        %span.alert-box.alert.radius
          %i.fa.fa-exclamation-triangle
          Error:
          &= @error

      %div.row
        %div.large-2.large-centered.columns
          %input.radius.button(type='submit' value='Parse')


  %aside.small-12.medium-4.columns
    %div.panel.callout.radius
      %h4 Example (Apache)
      %h6
        Regular expression:
      %pre#code-example
        %code
          & ^(?&lt;host&gt;[^ ]*) [^ ]* (?&lt;user&gt;[^ ]*) \[(?&lt;time&gt;[^\]]*)\] "(?&lt;method&gt;\S+)(?: +(?&lt;path&gt;[^ ]*) +\S*)?" (?&lt;code&gt;[^ ]*) (?&lt;size&gt;[^ ]*)(?: "(?&lt;referer&gt;[^\"]*)" "(?&lt;agent&gt;[^\"]*)")?$
      %h6
        Time Format:
      %pre#code-example
        %code
          & %d/%b/%Y:%H:%M:%S %z

%div.row
  %section.small-12.small-centered.columns
    %h3
      %i.fa.fa-file-code-o
      Configuration
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
    %h3
      %i.fa.fa-crosshairs
      Data Inspector
    %h4 Attributes
    %table.small-12
      %thead
        %tr
          %th.small-4 Key
          %th.small-8 Value
      %tbody
        - if @parsed
          %tr
            %th.small-4 time
            %td.small-8 #{Time.at(@parsed_time).strftime("%Y/%m/%d %H:%M:%S %z")}
        - else
          %tr
            %th.small-4
            %td.small-12
    %h4 Records
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
