# frozen_string_literal: true

require 'simplecov'
require 'simplecov-lcov'
SimpleCov::Formatter::LcovFormatter.config do |c|
  c.report_with_single_file = true
  c.single_report_path = 'coverage/lcov.info'
end
SimpleCov.formatter = SimpleCov::Formatter::LcovFormatter
SimpleCov.start

Warning[:deprecated] = true
ENV['RACK_ENV'] = 'test'
$LOAD_PATH.unshift(File.expand_path('../', File.dirname(__FILE__)))

require 'app'
require 'rspec'
require 'rack/test'

describe Fluentular do
  include Rack::Test::Methods

  subject { last_response }

  let(:app) do
    Sinatra::Application
  end

  describe 'GET /' do
    before { get '/' }

    it { is_expected.to be_ok }
    it { is_expected.to match 'Fluentular' }
  end

  describe 'GET /parse' do
    before { get '/parse', request_params }

    context 'with valid regular expression' do
      let(:request_params) do
        {
          input: 'example.com',
          regexp: '(?<host>[^ ]*)',
          time_format: ''
        }
      end

      it { is_expected.to be_ok }
      it { is_expected.to match '<th>host</th>\n<td>example.com</td>' }
    end

    context 'with parsing valid time format' do
      let(:request_params) do
        {
          input: '25/Nov/2013:18:09:45 +0900 example.com',
          regexp: '(?<time>[^ ]* [^ ]*) (?<host>[^ ]*)',
          time_format: '%d/%b/%Y:%H:%M:%S %z'
        }
      end
      let(:timestamp) { Regexp.escape('2013/11/25 18:09:45 +0900') }

      it { is_expected.to be_ok }
      it { is_expected.to match '<th>host</th>\n<td>example.com</td>' }
      it { is_expected.to match "<th.+>time</th>\\n<td.+>#{timestamp}</td>" }
    end

    context 'with empty regular expression' do
      let(:request_params) do
        {
          input: 'example.com',
          regexp: '',
          time_format: ''
        }
      end

      it { is_expected.to be_bad_request }
      it { is_expected.not_to match '<th>host</th>\n<td>example.com</td>' }
    end

    context 'with invalid regular expression' do
      let(:request_params) do
        {
          input: 'example.com',
          regexp: '(?<host>[^]*', # Unmatched parenthesis
          time_format: ''
        }
      end

      it { is_expected.to be_bad_request }
      it { is_expected.to match 'empty char-class' }
    end

    context 'with invalid time format' do
      let(:request_params) do
        {
          input: '25/Nov/2013:18:09:45 +0900 example.com',
          regexp: '(?<time>[^ ]* [^ ]*) (?<host>[^ ]*)',
          time_format: '%a' # Unmatched strptime format
        }
      end

      it { is_expected.to be_bad_request }
      it { is_expected.to match 'invalid time format' }
    end
  end

  describe 'GET /NOT_EXISTS_PAGE' do
    before { get '/NOT_EXISTS_PAGE' }

    it { is_expected.to be_not_found }
    it { is_expected.to match '<h1>Not Found</h1>' }
  end
end
