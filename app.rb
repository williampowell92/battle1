require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, "Our secret session"

  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player_name_1]),
                     Player.new(params[:player_name_2]))

    redirect '/play'
  end

  get '/play' do
    @player_name_1 = $game.player1.name
    @player_name_2 = $game.player2.name
    @player_hit_points_1 = $game.player1.health
    @player_hit_points_2 = $game.player2.health

    erb :play
  end

  get '/cripplethem' do
    $game.attack($game.player2)

    erb :cripplethem
  end
end
