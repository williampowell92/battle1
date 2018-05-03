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

    redirect '/play'
  end

  get '/play' do
    @player_name_1 = $player_1.name
    @player_name_2 = $player_2.name
    @player_hit_points_1 = $player_1.health
    @player_hit_points_2 = $player_2.health

    erb :play
  end

  get '/cripplethem' do
    $player_1.attack($player_2)

    erb :cripplethem
  end
end
