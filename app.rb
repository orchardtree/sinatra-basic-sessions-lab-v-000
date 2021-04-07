require_relative 'config/environment'

class App < Sinatra::Base
  
  configure do
    enable :sessions
    set :session_secret, "secret"
  end
  
  get '/' do
    session[:item] = @item.name
    @session = session
    erb :index
  end
  
  post '/checkout' do
    @item = Item.new(params[:item])
    erb :show
  end
  
end