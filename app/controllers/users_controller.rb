class UsersController < ApplicationController

    get '/login' do 
        erb :login 
    end

    post '/login' do    #the purpose of this route is to receive the login form, find the user, log the user in
     @user = User.find_by(email: params[:email])  #to find the user
     if @user && @user.authenticate(params[:password]) #to authenticate the user - if user is valid, create a session
        session[:user_id] = @user.id   #this is what logging a user in 
        puts session 
        flash[:message] = "Hi, #{@user.name}!"
        redirect "users/#{@user.id}"                                      
     else
        flash[:errors] = "You entered incorrect information. Please try again!"
        redirect '/login'
     end
    end

    get '/signup' do #this routes job is to render the signup form
        erb :signup   #erb (render) a view
    end

    post '/users' do 
        if params[:name] !="" && params[:email] != "" && params[:password] !="" #as long as all these params are valid, the user can be created
         @user = User.create(params)  #valid input, assign it to an instance variable
         session[:user_id] = @user.id
         redirect "/users/#{@user.id}" #we will grab user's id and redirect them to the users show page
        else
        flash[:errors] ="Please fill out all fields."
         redirect '/signup'                          #invalid input
        end        
     end
 
     get '/users/:id' do   #user show route
        
        if current_user.id == params[:id].to_i
         @user = User.find_by(id: params[:id])
          #this actually is logging in the user
         erb :'/users/show'
        else
            redirect "/users/#{current_user.id}"
        end
     end

    get '/logout' do 
        session.clear
        redirect '/'
    end

end