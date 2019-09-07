class SuggestionEntriesController < ApplicationController

    get '/suggestion_entries' do 
        @suggestion_entries = SuggestionEntry.all 
        erb :'suggestion_entries/index'
    end 


    #get suggestion_entries/new to render a form to create new entry
    get '/suggestion_entries/new' do 
        erb :'/suggestion_entries/new'
    end

   # post suggestion_entries to crete a new suggestion entry

    post '/suggestion_entries' do 
        if !logged_in?   #create a new suggestion entry only if logged in
            redirect '/'
        end

        if params[:content] != ""  #only save the entry if it has some content
            @suggestion_entry = SuggestionEntry.create(content: params[:content], user_id: current_user.id) #create a new entry
            redirect "/suggestion_entries/#{@suggestion_entry.id}"
        else
            redirect '/suggestion_entries/new'
        end
    end


   #show page for a suggestion entry
    get '/suggestion_entries/:id' do 
        set_suggestion_entry
        erb :'/suggestion_entries/show'
    end


   #this route should send us to suggestion_entries/edit.erb which will render the edit form
    get '/suggestion_entries/:id/edit' do 
        set_suggestion_entry
        if logged_in?                               #first we check if the user is logged in, if not redirect them to the main page
            if @suggestion_entry.user == current_user  #then we check if it's the actual user owns this who is logged in, if not redirect them to their user page
                erb :'/suggestion_entries/edit'
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    #this route 
    patch '/suggestion_entries/:id' do
       # this route find the suggestion entry
        set_suggestion_entry
        if logged_in?
            if @suggestion_entry.user == current_user     
      #modify the suggestion entry using Active Record method 
        @suggestion_entry.update(content: params[:content])
       #redirect to show page
       redirect "/suggestion_entries/#{@suggestion_entry.id}"
            else   
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    private 

    def set_suggestion_entry
        @suggestion_entry = SuggestionEntry.find(params[:id])
    end



end