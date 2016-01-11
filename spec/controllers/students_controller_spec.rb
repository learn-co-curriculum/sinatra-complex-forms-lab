require 'spec_helper'

describe "Students Controller" do
  describe "new action" do 

    it "can visit '/students/new'" do
      get '/students/new'
      expect(last_response.status).to eq(200)
    end

    it "'/students/new' loads form to create a new owner" do
      visit '/students/new'
      expect(page).to have_field(:student_name)
    end

    it "'/students/new' form has a checkbox for existing stars" do
      @star1 = Star.create(:name => "help a student")
      @star2 = Star.create(:name => "clean the kitchen")
      visit '/students/new'
      expect(page.has_unchecked_field?(@star1.name)).to eq(true)
      expect(page.has_unchecked_field?(@star2.name)).to eq(true)
    end

    it "'/students/new' form has a field for creating a new star" do
      visit '/students/new'
      expect(page).to have_field(:star_name)
    end


    it " creates a new student and associates an existing star " do
      @star1 = Star.create(:name => "help a student")
      @star2 = Star.create(:name => "clean the kitchen")
      visit '/students/new'
      fill_in "student_name", :with => "Sophie"
      check(@star1.name)
      click_button "Create Student"
      @student = Student.last
      expect(@student.name).to eq("Sophie")

      expect(@student.stars.first.name).to eq("help a student")
    end

      it " creates a new student and a new star" do
      @star1 = Star.create(:name => "help a student")
      @star2 = Star.create(:name => "clean the kitchen")
      visit '/students/new'
      fill_in "student_name", :with => "seji"
      fill_in "star_name", :with => "swept the floor"
      click_button "Create Student"
      @student = Student.last
      @star = Star.last
      expect(@student.name).to eq("seji")
      expect(@student.stars.first.name).to eq("swept the floor")
    end

    it " redirects to '/students/:id' after form submissions" do
      @star1 = Star.create(:name => "help a student")
      @star2 = Star.create(:name => "clean the kitchen")
      visit '/students/new'
      fill_in "student_name", :with => "Elana"
      check(@star1.name)
      click_button "Create Student"
      @student = Student.last
      expect(page.current_path).to eq("/students/#{@student.id}")
    end
  end

  describe "edit action" do 
    before(:each) do
      @student = Student.create(:name => "Bethany")
      @star = Star.create(:name => "wrote a blog post", :student_id => @student.id)
    end

    it "can visit '/students/:id/edit' " do 
      get "/students/#{@student.id}/edit"
      expect(last_response.status).to eq(200)
    end

    it "'/owners/:id/edit' loads form to edit a student and his stars" do
      visit "/students/#{@student.id}/edit"
      expect(page).to have_field(:student_name)
      expect(page.has_checked_field?(@star.name)).to eq(true)
      expect(page).to have_field(:star_name)
    end

     it "edits the student's name" do
      visit "/students/#{@student.id}/edit"
      fill_in "student_name", :with => "Bethany Beckles"
      click_button "Update Student"
      expect(Student.last.name).to eq("Bethany Beckles")
    end

  #   it "edit's the owner's pets with an existing pet" do
  #     @shaggy = Pet.create(:name => "Shaggy")
  #     visit "/owners/#{@owner.id}/edit"
  #     check("Shaggy")
  #     click_button "Update Owner"
  #     expect(Owner.last.pets.last.name).to eq("Shaggy")
  #   end

  #   it "edit's the owner's pets with a new pet" do
  #     visit "/owners/#{@owner.id}/edit"
  #     fill_in "pet_name", :with => "Carlton"
  #     click_button "Update Owner"
  #     expect(Owner.last.pets.last.name).to eq("Carlton")
  #   end


  end

end