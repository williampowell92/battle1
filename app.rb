require 'sinatra/base'
require_relative './lib/player'

class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, "Our secret session"

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new(params[:player_name_1])
    $player_2 = Player.new(params[:player_name_2])
    session[:player_hit_points_1] = 50
    session[:player_hit_points_2] = 50
    redirect '/play'
  end

  get '/play' do
    @player_name_1 = $player_1.name
    @player_name_2 = $player_2.name
    @player_hit_points_1 = session[:player_hit_points_1]
    @player_hit_points_2 = session[:player_hit_points_2]

    erb :play
  end

  get '/cripplethem' do
    erb :cripplethem
  end
end
