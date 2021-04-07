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
    @session = session
    erb :show
  end
  
end


    #session[:item] = item_name
    #@session = session