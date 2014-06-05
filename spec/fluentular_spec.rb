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

    context 'with invalid regular expression' do
      before do
        params[:input]  = 'example.com'
        params[:regexp] = '(?<host>[^]*' # Unmatched parenthesis
      end

      it 'returns error message' do
        get '/parse', params do
          expect(last_response).to match 'empty char-class'
        end
      end
    end

    context 'with invalid time format' do
      before do
        params[:input]  = '2014/06/05 13:55:04 example.com'
        params[:regexp] = '(?<time>[^ ]* [^ ]*) (?<host>[^ ]*)'
        params[:time_format] = '%a' # Unmatched strptime format
      end

      it 'returns error message' do
        get '/parse', params do
          expect(last_response).to match 'invalid strptime format'
        end
      end
    end
  end
end
