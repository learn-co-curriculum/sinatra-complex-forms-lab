class CreateStarsTable < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.string :name
      t.integer :student_id
    end
  end
end