class StarsController < ApplicationController

  get '/stars/new' do 
    erb :'/stars/new'
  end

  post '/stars' do 
    @star = Star.create(params[:star])
    if !params["student"]["name"].empty?
      @star.student = Student.create(name: params["student"]["name"])
    end
    @star.save
    redirect "stars/#{@star.id}"
  end

  get '/stars/:id' do 
    @star = Star.find(params[:id])
    erb :'/stars/show'
  end

  post '/stars/:id' do 
    @star = Star.find(params[:id])
    @star.update(params["star"])
    if !params["student"]["name"].empty?
      @star.student = Student.create(name: params["student"]["name"])
    end
    @star.save
    redirect "stars/#{@star.id}"
  end

  get '/stars/:id/edit' do 
    @star = Star.find(params[:id])
    erb :'/stars/edit'
  end

end