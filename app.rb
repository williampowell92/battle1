require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, "Our secret session"

  before do
    @game = Game.instance
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    @game.turn = 0
    @game.player1 = Player.new(params[:player_name_1])
    @game.player2 = Player.new(params[:player_name_2])

    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  get '/cripplethem' do
    @game.attack
    erb :cripplethem
  end

  get '/death' do
    erb :death
  end
end
