class StudentsController < ApplicationController

  get '/students/new' do 
    erb :'/students/new'
  end

  post '/students' do 
  end

  get '/students' do 
    erb :'/students/show'
  end

  get '/students/:id/edit' do 
    @student = Student.find_by_id(params[:id])
    erb :'students/:id/edit'
  end

  post '/students/:id' do 
  end

  get '/students/:id' do 
     @student = Student.find_by_id(params[:id])
     erb :'students/show'
  end

end