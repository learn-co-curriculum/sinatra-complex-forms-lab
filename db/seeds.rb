# Add seed data here. Seed your database with `rake db:seed`
victoria = Student.create(name: "Victoria")
Star.create(name: "Help a student", student: victoria)
Star.create(name: "ask a question", student: victoria)