require 'sinatra/base'

class Battle < Sinatra::Base

  get '/' do
    'hello, you filthy animal'
  end

end
