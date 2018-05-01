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
    session[:player_hit_points_1] = 50
    session[:player_hit_points_2] = 50
    redirect '/play'
  end

  get '/play' do
    @player_name_1 = session[:player_name_1]
    @player_name_2 = session[:player_name_2]
    @player_hit_points_1 = session[:player_hit_points_1]
    @player_hit_points_2 = session[:player_hit_points_2]

    erb :play
  end


end
