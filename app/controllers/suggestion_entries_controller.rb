class SuggestionEntriesController < ApplicationController

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
        @suggestion_entry = SuggestionEntry.find(params[:id])
        erb :'/suggestion_entries/show'
    end


   #this route should send us to suggestion_entries/edit.erb which will render the edit form
    get '/suggestion_entries/:id/edit' do 
        erb :'/suggestion_entries/edit'
    end


end