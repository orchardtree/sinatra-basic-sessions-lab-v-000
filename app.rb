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
  
=begin
    it "sets the params in the session hash" do 
      params = {
        :item => "socks"
      }
      post '/checkout', params
      #expect(session.has_key?(:item)).to eq(true)
      expect(session[:item]).to eq(params[:item])
    end
=end
  
  post '/checkout' do
    session[:item] = params[:item]
    @session = session
    @item = Item.new(params[:item])
    #binding.pry
    erb :show
  end
  
end






