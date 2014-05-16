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

  describe 'GET /parse' do
    let(:params) do
      { input: '', regexp: '', time_format: '' }
    end

    context 'with valid regular expression' do
      before do
        params[:input]  = 'example.com'
        params[:regexp] = '(?<host>[^ ]*)'
      end

      it 'returns parsed records' do
        get '/parse', params do
          expect(last_response).to be_ok
          expect(last_response).to match '<th>host</th>\n.+<td>example.com</td>'
        end
      end
    end

    context 'with empty regular expression' do
      before do
        params[:input] = 'example.com'
      end

      it 'returns no records' do
        get '/parse', params do
          expect(last_response).to be_ok
          expect(last_response).not_to match '<th>host</th>\n.+<td>example.com</td>'
        end
      end
    end
  end
end
