ENV['RACK_ENV'] = 'test'
$LOAD_PATH.unshift(File.expand_path('../', File.dirname(__FILE__)))

require 'app'
require 'rspec'
require 'rack/test'

describe 'Fluentular' do
  include Rack::Test::Methods

  let(:app) do
    Sinatra::Application
  end

  describe 'GET /' do
    it 'returns an index' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to match 'Fluentular'
    end
  end

  describe 'GET /parse?input=:input&regexp=:regexp&time_format=:time_format' do
    context 'with valid regular expression' do
      let(:valid_regexp_param) do
        URI.encode('input=example.com&regexp=(?<host>[^ ]*)&time_format=')
      end

      it 'returns parsed records' do
        get '/parse?' + valid_regexp_param do
          expect(last_response).to be_ok
          expect(last_response).to match '<th>host</th>\n.+<td>example.com</td>'
        end
      end
    end

    context 'with empty regular expression' do
      let(:empty_regexp_param) do
        URI.encode('input=example.com&regexp=&time_format=')
      end

      it 'returns no records' do
        get '/parse?' + empty_regexp_param do
          expect(last_response).to be_ok
          expect(last_response).not_to match '<th>host</th>\n.+<td>example.com</td>'
        end
      end
    end
  end
end
