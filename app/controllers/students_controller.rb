class StudentsController < ApplicationController

  get '/students/new' do 
    erb :'/students/new'
  end

  post '/students' do 
    @student = Student.create(params[:student])
    if !params["star"]["name"].empty?
      @student.stars << Star.create(name: params["star"]["name"])
    end
    @student.save
    redirect "students/#{@student.id}"
  end

  get '/students' do 
    erb :'/students/show'
  end

  get '/students/:id/edit' do 
    @student = Student.find_by_id(params[:id])
    erb :'/students/edit'
  end

  post '/students/:id' do 
    @student = Student.find(params[:id])
    @student.update(params["student"])
    if !params["star"]["name"].empty?
      @student.stars << Stars.create(name: params["star"]["name"])
    end
    redirect "students/#{@student.id}"
  end

  get '/students/:id' do 
     @student = Student.find_by_id(params[:id])
     erb :'students/show'
  end

end