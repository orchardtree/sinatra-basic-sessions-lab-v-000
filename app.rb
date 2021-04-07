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
    item_name = params[:item].fetch("name")
    session[:item] = item_name
    @session = session
    @item = Item.new(params[:item])
    binding.pry
    erb :show
  end
  
end