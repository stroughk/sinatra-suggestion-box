class UsersController < ApplicationController

    get '/login' do 
        erb :login 
    end

    post '/login' do    #the purpose of this route is to receive the login form, find the user, log the user in
     @user = User.find_by(email: params[:email])  #to find the user
     if @user.authenticate(params[:password]) #to authenticate the user - if user is valid, create a session
        session[:user_id] = @user.id   #this is what logging a user in 
        puts session 
        redirect "users/#{@user.id}"                                      
     else
         
     end
    end

    get '/signup' do #this routes job is to render the signup form
        erb :signup   #erb (render) a view
    end

    post '/users' do 
        binding.pry
    end

    get '/users/:id' do   #user show route
        "Show route"
    end

    

end