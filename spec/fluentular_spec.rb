# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'
$LOAD_PATH.unshift(File.expand_path('../', File.dirname(__FILE__)))

require 'coveralls'
Coveralls.wear!

require 'app'
require 'rspec'
require 'rack/test'

describe 'Fluentular' do
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
          time_format: time_format
        }
      end
      let(:time_format) { '%d/%b/%Y:%H:%M:%S %z' }

      it { is_expected.to be_ok }
      it { is_expected.to match '<th>host</th>\n<td>example.com</td>' }
      specify 'returns parsed time' do
        expect_timestamp = Time.strptime('25/Nov/2013:18:09:45 +0900', time_format).strftime("%Y/%m/%d %H:%M:%S %z")
        expect(last_response).to match '<th[^>]*>time</th>\n<td[^>]*>' + Regexp.escape(expect_timestamp) + '</td>'
      end
    end

    context 'with empty regular expression' do
      let(:request_params) do
        {
          input: 'example.com',
          regexp: '',
          time_format: ''
        }
      end

      it { is_expected.to be_ok }
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

      it { is_expected.to be_ok }
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

      it { is_expected.to be_ok }
      it { is_expected.to match 'invalid time format' }
    end
  end
end
