class UsersController < ApplicationController

    get '/login' do 
        erb :login 
    end

    post '/login' do    #the purpose of this route is to receive the login form, find the user, log the user in
     @user = User.find_by(email: params[:email])  #to find the user
     if @user.authenticate(params[:password]) #to authenticate the user - if user is valid, create a session
                                                
     else
         
     end
    end

    get '/signup' do 

    end

end