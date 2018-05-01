require 'sinatra/base'

class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, "Our secret session"

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:player_name_1] = params[:player_name_1]
    session[:player_name_2] = params[:player_name_2]
    redirect '/play'
  end

  get '/play' do
    @player_1 = session[:player_name_1]
    @player_2 = session[:player_name_2]
    erb :play
  end


end
