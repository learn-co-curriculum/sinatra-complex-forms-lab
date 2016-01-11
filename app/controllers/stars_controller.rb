class StarsController < ApplicationController

  get '/stars/new' do 
    erb :'/stars/new'
  end

  post '/stars' do 
   #code solution here
  end

  get '/stars/:id' do 
    @star = Star.find(params[:id])
    erb :'/stars/show'
  end

  post '/stars/:id' do 
    #code solution here
  end

  get '/stars/:id/edit' do 
    @star = Star.find(params[:id])
    erb :'/stars/edit'
  end

end