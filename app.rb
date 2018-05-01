require 'sinatra/base'

class Battle < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/play' do
    @player_name_1 = params[:player_name_1]
    @player_name_2 = params[:player_name_2]
    erb(:index)
  end

end
