require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #have access to a hash called sessions
    set :session_secret, "ninja_secret_app"  #session id will be created for the particular session.
  end

  get "/" do
    erb :welcome
  end

end
