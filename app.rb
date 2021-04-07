require 'pry'
require_relative 'config/environment'

class App < Sinatra::Base
  
  configure do
    enable :sessions
    set :session_secret, "secret"
  end
  
  get '/' do
    erb :index
  end
  
  post '/checkout' do
    @item = Item.new(params[:item])
    session[:item] = @item.name
    #@session = session
    #binding.pry
    erb :show
  end
  
end