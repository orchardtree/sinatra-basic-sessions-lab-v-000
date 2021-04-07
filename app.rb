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
    session[:item] = params[:item]
    @session = session
    @item = Item.new(params[:item])
    #binding.pry
    erb :show
  end
  
end






