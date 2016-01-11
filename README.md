# Sinatra and Active Record: Associations and Complex Forms

## Objectives

1. Build forms that allow a user to create and edit a given resource and its associated resources. 
2. Build controller actions that handle the requests sent by such forms. 

## Instructions

We're going to build a virtual gold star board. This app has two models: `star` and `student`. A student `has_many` stars, and stars `belong_to` a student.

We've built out the basic models and controller actions for you. Make sure you run the tests to make sure you're coding your solutions correctly. Run `shotgun` to test your work in the browser. Run `rake db:seed` to see your database.

1. Create a form to create a new student. The form should have a field to enter a student's name. There should be a section of check-boxes that display all the stars that exist in the database. A user should be able to create a star in the same form as creating a new student. The form should POST to `/students` and display the created student and their gold stars.

You'll need to update the controller action that handles the form submission and student creation. The controller action should redirect to `'/students/:id'`.

2. Create a form to edit a student. The form should have a field to edit the student's name, as well as change it's gold stars. A user should be able to create a new gold star here as well. This form should POST to `/students/:id`.

Again, you'll need to update the controller action that handles updating a student. The page should display the student's name and all their stars.

3.  Create a form to create a new star. The form should have a field to create a name, as well as check-boxes that display any existing students. A user should also have the option to create a new student to associate with this star. This form should POST to `/stars`.

You'll need to update the controller action associated with creating a new star. The controller action should redirect to `'/stars/:id'`

4. Create a form to edit a star. The form should have a field to edit the star's name, as well as change it's student. A user should be able to create a new student here as well. This form should POST to `/stars/:id`.

Again, you'll need to update the controller action that handles updating a star. The page should display all the info about a star, including it's name and student.