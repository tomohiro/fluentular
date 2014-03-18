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
  @regexp = params[:regexp]
  @input  = params[:input]
  @time_format = params[:time_format]

  begin
    parser = Fluent::TextParser::RegexpParser.new(Regexp.new(@regexp))
    parser.time_format = @time_format if not @time_format.empty?
    @parsed_time, @parsed = parser.call(@input)
  rescue
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
    %title Fluentular: a Fluentd regular expression editor
    %link(rel='stylesheet' href='/stylesheets/font-awesome.css')
    %link(rel='stylesheet' href='/stylesheets/foundation.css')
    %link(rel='stylesheet' href='/stylesheets/app.css')
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


  %body
    %a(href='http://github.com/Tomohiro/fluentular')
      %img.github(src='http://s3.amazonaws.com/github/ribbons/forkme_right_red_aa0000.png' alt='Fork me on GitHub')

    %header.row
      %section
        %h1
          %a(href='/') Fluentular
        %h4 a Fluentd regular expression editor

    %article
      = yield

    %footer.row
      %section.four.columns
        %p
          &copy; 2013
          %a(href='https://github.com/Tomohiro') Tomohiro TAIRA
      %section.four.columns.offset-by-four
        %p.right
          Powered by
          %a(href='http://www.sinatrarb.com/') Sinatra
          Hosted on
          %a(href='http://heroku.com') Heroku

@@ index
%div.row
  %section.eight.columns
    %form(method='GET' action='/parse')
      %label Regular Expression
      %textarea(name='regexp' rows=5)&= @regexp

      %label Test String
      %textarea(name='input' rows=5)&= @input

      %label Custom Time Format (e.g. %Y-%m-%d %H:%M:%S)
      %textarea(name='time_format' rows=1)&= @time_format

      %input.radius.button(type='submit' value='Parse')

  %aside.four.columns
    %div.panel.radius
      %h4 Regexp example
      %h5
        %i.icon-check
        Apache
      %code
        ^(?&lt;host&gt;[^ ]*) [^ ]* (?&lt;user&gt;[^ ]*) \[(?&lt;time&gt;[^\]]*)\] "(?&lt;method&gt;\S+)(?: +(?&lt;path&gt;[^ ]*) +\S*)?" (?&lt;code&gt;[^ ]*) (?&lt;size&gt;[^ ]*)(?: "(?&lt;referer&gt;[^\"]*)" "(?&lt;agent&gt;[^\"]*)")?$
      %h5
        %i.icon-check
        Syslog
      %code
        ^(?&lt;time&gt;[^ ]* [^ ]* [^ ]*) (?&lt;host&gt;[^ ]*) (?&lt;ident&gt;[a-zA-Z0-9_\/\.\-]*)(?:\[(?&lt;pid&gt;[0-9]+)\])?[^\:]*\: *(?&lt;message&gt;.*)$

%div.row
  %section.twelve
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
  %section
    %h4 Data Inspector
    %h5 Attribute
    %table.twelve
      %thead
        %tr
          %th.four Key
          %th.eight Value
      %tbody
        - if @parsed
          %tr
            %th.four time
            %td.eight #{Time.at(@parsed_time).strftime("%Y/%m/%d %H:%M:%S")}
        - else
          %tr
            %th.four
            %td.eight
    %h5 Record
    %table.twelve
      %thead
        %tr
          %th.four Key
          %th.eight Value
      %tbody
        - if @parsed
          - @parsed.each do |key, value|
            %tr
              %th= key
              %td= value
        - else
          %tr
            %th 
            %td 
