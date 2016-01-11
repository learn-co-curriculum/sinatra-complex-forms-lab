require 'spec_helper'

describe "Pets Controller" do
  describe "new action" do 

    it "can visit '/stars/new'" do
      get '/stars/new'
      expect(last_response.status).to eq(200)
    end

    it " loads form to create a new star" do
      visit '/stars/new'
      expect(page).to have_field(:star_name)
    end

    it "has a form with a check-box for existing students" do
      @student1 = Student.create(:name => "Cricky")
      @student2 = Student.create(:name => "Chris")

      visit '/stars/new'
      expect(page.has_unchecked_field?(@student1.name)).to eq(true)
      expect(page.has_unchecked_field?(@student2.name)).to eq(true)
    end

    it "has a field for creating a new owner" do
      visit '/stars/new'
      expect(page).to have_field(:student_name)
    end


    it "creates a new star and associates an existing student" do
      @student1 = Student.create(:name => "Cricky")
      @student2 = Student.create(:name => "Chris")
      visit '/stars/new'
      fill_in "star_name", :with => "wrote a quora post"
      check(@student1.name)
      click_button "Create Star"
      @star = Star.last
      expect(@star.name).to eq("wrote a quora post")
      expect(@star.student.name).to eq("Cricky")
    end

      it " creates a new star and a new student" do
      visit '/stars/new'
      fill_in "star_name", :with => "answered stack overflow question"
      fill_in "student_name", :with => "John Michael"
      click_button "Create Star"
      @star = Star.last
      @student = Student.last
      expect(@star.name).to eq("answered stack overflow question")
      expect(@star.student.name).to eq("John Michael")
    end

    it "redirects to '/stars/:id' after form submissions" do
      @student1 = Student.create(:name => "Kristi")
      @student2 = Student.create(:name => "Kaitlin")
      visit '/stars/new'
      fill_in "star_name", :with => "made an open source commit"
      check(@student2.name)
      click_button "Create Star"
      @star = Star.last
      expect(page.current_path).to eq("/stars/#{@star.id}")
    end
  end

  describe "edit action" do 
    before(:each) do
      @student = Student.create(:name => "Carly")
      @star = Star.create(:name => "finished a lab", :student_id => @student.id)
    end

    it "can visit '/stars/:id/edit' " do 
      get "/stars/#{@star.id}/edit"
      expect(last_response.status).to eq(200)
    end

    it " loads form to edit a star and its student" do
      visit "/stars/#{@star.id}/edit"
      expect(page).to have_field(:star_name)
      expect(page.has_checked_field?(@student.name)).to eq(true)
      expect(page).to have_field(:student_name)
    end

     it "edit's the star's name" do
      visit "/stars/#{@star.id}/edit"
      fill_in "star_name", :with => "Finished a lab!!!!!!"
      click_button "Update Star"
      expect(Star.last.name).to eq("Finished a lab!!!!!!")
    end

    it "edit's the star's student with an existing student" do
      @kyle = Student.create(:name => "kyle")
      visit "/stars/#{@star.id}/edit"
      check("kyle")
      click_button "Update Star"
      expect(Star.last.student.name).to eq("kyle")
    end

    it "edits the star's student with a new student" do
      visit "/stars/#{@star.id}/edit"
      fill_in "student_name", :with => "Elizabeth"
      click_button "Update Star"
      expect(Star.last.student.name).to eq("Elizabeth")
    end


  end

end
