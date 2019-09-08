require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #have access to a hash called sessions
    set :session_secret, "ninja_secret_app"  #session id will be created for the particular session.
    register Sinatra::Flash 
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  helpers do #helper methods

    def logged_in? #should return true if logged in, otherwise false
      !!current_user  #takes a value and returns a boolean value - true or false whether there is a user or not
    end

    def current_user 
      @current_user ||= User.find_by(id: session[:user_id])  #this will return the user if there is one | memorization to eliminate multiple database calls
    end

    def authorized?(suggestion_entry)
      suggestion_entry.user == current_user
    end


  end



end
